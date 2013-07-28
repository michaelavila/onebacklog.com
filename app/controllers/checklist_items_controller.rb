class ChecklistItemsController < ApplicationController
  def toggle
    checklist_item = ChecklistItem.find params[:checklist_item_id]
    checklist_item.update_attributes :completed => (not checklist_item.completed)
    render :nothing => true
  end

  def destroy
    ChecklistItem.delete params[:checklist_item_id]
    render :nothing => true
  end

  def update
    checklist_item = ChecklistItem.find params[:checklist_item_id]
    checklist_item.update_attributes params.require(:checklist_item).permit(:description)
    render :nothing => true
  end
end
