require 'spec_helper'

describe BacklogItemsController do
  describe 'routing' do
    it 'routes /backlog/:backlog_item_id to backlog_items#show' do
      get('/backlog/1').should route_to(
          'backlog_items#show',
          :backlog_item_id => '1'
        )
    end
  end
end
