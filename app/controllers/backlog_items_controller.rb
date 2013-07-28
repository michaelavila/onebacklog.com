class BacklogItemsController < ApplicationController
  respond_to :html, :json

  def show
    @backlog_item = BacklogItem.find params[:backlog_item_id]
  end

  def update
    @backlog_item = BacklogItem.find params[:backlog_item_id]
    @backlog_item.update_attributes(
      params.require(:backlog_item).permit :description
    )
    respond_with @backlog_item
  end
end
