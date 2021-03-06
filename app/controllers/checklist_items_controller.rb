class ChecklistItemsController < ApplicationController
  before_filter :find_checklist_item, :except => [:destroy, :create]

  def find_checklist_item
    @checklist_item = ChecklistItem.find params[:checklist_item_id]
  end

  def toggle
    @checklist_item.update_attributes :completed => (not @checklist_item.completed)
    render :nothing => true
  end

  def update
    @checklist_item.update_attributes params.require(:checklist_item).permit(:description)
    render :nothing => true
  end

  def destroy
    ChecklistItem.delete params[:checklist_item_id]
    render :nothing => true
  end

  def create
    params[:checklist_item] = params[:checklist_item].merge :backlog_item_id => params[:backlog_item_id]
    checklist_item = ChecklistItem.create params.require(:checklist_item).permit :backlog_item_id, :description
    redirect_to backlog_item_path(params[:backlog_item_id])
  end
end
