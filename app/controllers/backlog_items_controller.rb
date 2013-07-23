class BacklogItemsController < ApplicationController
  def show
    @backlog_item = BacklogItem.find params[:backlog_item_id]
  end
end
