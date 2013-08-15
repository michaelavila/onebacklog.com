require 'spec_helper'

describe BacklogItemsController do
  describe 'routing' do
    it 'routes /onebacklog/:backlog_item_id to backlog_items#show' do
      get('/onebacklog/1').should route_to(
          'backlog_items#show',
          :backlog_item_id => '1'
        )
    end

    it 'routes /onebacklog/:backlog_item_id/delete to backlog_items#destroy' do
      get('/onebacklog/1/delete').should route_to(
          'backlog_items#destroy',
          :backlog_item_id => '1'
        )
    end
  end
end
