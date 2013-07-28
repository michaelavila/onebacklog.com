class BacklogItemsController < ApplicationController
  respond_to :html, :json

  def show
    @backlog_item = BacklogItem.find params[:backlog_item_id]
  end

  def update
    @backlog_item = BacklogItem.find params[:backlog_item_id]
    @backlog_item.update_attributes(
      params.require(:backlog_item).permit :description, :name
    )
    respond_with @backlog_item
  end

  def comment
    comment = BacklogItem.find(params[:backlog_item_id]).comments.new params.require(:comment).permit(:comment)
    comment.user = User.all.first
    comment.save
    redirect_to backlog_item_path(params[:backlog_item_id])
  end
end
