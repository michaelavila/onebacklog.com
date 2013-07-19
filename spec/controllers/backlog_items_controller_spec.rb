require 'spec_helper'

describe BacklogItemsController do
  describe '#show' do
    it 'assigns the correct backlog_item' do
      @backlog_item = mock(:id => 1)
      BacklogItem.should_receive(:find).with("#{@backlog_item.id}").and_return @backlog_item

      get :show, :id => @backlog_item.id

      expect(assigns :backlog_item).to eq(@backlog_item)
    end
  end
end
