require 'spec_helper'

describe 'backlog_items/show.html.erb' do
  it 'uses success colors when item is complete' do
    assign :backlog_item, BacklogItem.create(:complete => true, :status => '', :creator => User.create, :updater => User.create)
    
    render
    rendered.should have_css('li#status.done')
    rendered.should have_css('#position.done')
  end

  it 'uses warning colors when item is not complete' do
    assign :backlog_item, BacklogItem.create(:complete => false, :status => '', :creator => User.create, :updater => User.create)
    
    render
    rendered.should have_css('li#status.wip')
    rendered.should have_css('#position.wip')
  end
end
