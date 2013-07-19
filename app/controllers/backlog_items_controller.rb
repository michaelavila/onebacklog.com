class BacklogItemsController < ApplicationController
  def show
    @backlog_item = BacklogItem.find params[:id]
  end
end
