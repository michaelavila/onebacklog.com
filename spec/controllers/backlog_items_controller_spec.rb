require 'spec_helper'

describe BacklogItemsController do
  describe '#show' do
    it 'assigns the correct backlog_item' do
      @backlog_item = double(:id => 1)
      BacklogItem.should_receive(:find).with("#{@backlog_item.id}").and_return @backlog_item

      get :show, :backlog_item_id => @backlog_item.id

      expect(assigns :backlog_item).to eq(@backlog_item)
    end
  end

  describe '#update' do
    it 'changes the updater and updated time' do
      updater = User.create :email => 'updater@example.com', :password => 'password longer'
      sign_in updater
      @backlog_item = mock_model(BacklogItem, :id => 1)
      BacklogItem.should_receive(:find).with("#{@backlog_item.id}").and_return @backlog_item
      @backlog_item.should_receive(:update_attributes).with(
        'description' => 'something',
        'updater_id' => updater.id
      )
        
      put :update, {
        :backlog_item_id => 1,
        :backlog_item => {
          :description => 'something'
        }
      }
    end
  end

  describe '#comment' do
    it 'changes the updater and updated time' do
      updater = User.create :email => 'updater@example.com', :password => 'password longer'
      sign_in updater
      @backlog_item = BacklogItem.create :name => 'something'
        
      post :comment, {
        :backlog_item_id => 1,
        :comment => {
          :comment => 'something'
        }
      }

      BacklogItem.find(1).updater_id.should == updater.id
    end
  end
end
