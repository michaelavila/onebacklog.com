require 'spec_helper'

describe ChecklistItemsController do
  describe '#toggle' do
    before :each do
      @checklist_item = double :id => 1
      ChecklistItem.should_receive(:find).with("#{@checklist_item.id}").and_return @checklist_item
    end

    it 'toggles complete for the item from false to true' do
      @checklist_item.should_receive(:completed).and_return false
      @checklist_item.should_receive(:update_attributes).with(:completed => true)

      get :toggle, :checklist_item_id => @checklist_item.id
    end

    it 'toggles complete for the item from false to true' do
      @checklist_item.should_receive(:completed).and_return true
      @checklist_item.should_receive(:update_attributes).with(:completed => false)

      get :toggle, :checklist_item_id => @checklist_item.id
    end
  end
end
