class ChecklistItemsController < ApplicationController
  def toggle
    checklist_item = ChecklistItem.find params[:checklist_item_id]
    checklist_item.update_attributes :completed => (not checklist_item.completed)
    render :nothing => true
  end
end
