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

  def create
    checklist_item = ChecklistItem.new params.require(:checklist_item).permit(:description)
    checklist_item.backlog_item_id = params[:backlog_item_id]
    checklist_item.save
    redirect_to backlog_item_path(params[:backlog_item_id])
  end
end
