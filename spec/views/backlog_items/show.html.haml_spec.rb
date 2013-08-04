require 'spec_helper'

describe 'backlog_items/show.html.haml' do
  before :each do
    @backlog_item = BacklogItem.create(:complete => true, :status => 'TESTING', :creator => User.create, :updater => User.create)
    assign :backlog_item, @backlog_item
  end

  describe 'status' do
    it 'uses success colors when item is complete' do
      @backlog_item.update_attribute :complete, true
      
      render
      rendered.should have_css('#status.done')
      rendered.should have_css('#position.done')
    end

    it 'uses warning colors when item is not complete' do
      @backlog_item.update_attribute :complete, false
      
      render
      rendered.should have_css('#status.wip')
      rendered.should have_css('#position.wip')
    end
  end

  describe 'people' do
    it 'shows correct empty message' do
      render
      rendered.should have_content("No active people")
    end
  end

  describe 'project labels' do
    it 'shows correct empty message' do
      render
      rendered.should have_content("No project labels")
    end
  end
end
