class BacklogItemsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  def show
    @backlog_item = BacklogItem.find params[:backlog_item_id]
  end

  def update
    @backlog_item = BacklogItem.find params[:backlog_item_id]
    params[:backlog_item] = params[:backlog_item].merge :updater_id => current_user.id
    attributes = params.require(:backlog_item).permit :description, :name, :updater_id
    @backlog_item.update_attributes attributes
    respond_with @backlog_item
  end

  def comment
    backlog_item = BacklogItem.find(params[:backlog_item_id])
    backlog_item.update_attributes :updater_id => current_user.id
    comment = backlog_item.comments.new params.require(:comment).permit(:comment)
    comment.user = current_user
    comment.save
    redirect_to backlog_item_path(params[:backlog_item_id])
  end
end
