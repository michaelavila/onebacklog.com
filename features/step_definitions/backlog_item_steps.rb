include ActionView::Helpers::DateHelper

Given /^a backlog item exists$/ do
  creator = User.create :email => 'creator@example.com', :password => 'password longer'
  updater = User.create :email => 'updater@example.com', :password => 'password longer'
  @backlog_item = BacklogItem.create(
    :name => 'Name for Testing',
    :description => 'Description for Testing',
    :created_at => Date.yesterday.yesterday,
    :updated_at => Date.today,
    :status => 'Status for Testing',
    :label_list => 'First Label for Testing, Second Label for Testing',
    :project_list => 'First Project for Testing, Second Project for Testing',
    :creator => creator,
    :updater => updater,
  )
  @backlog_item.comments.create :comment => "First Comment for Testing", :user => creator
  @backlog_item.comments.create :comment => "Second Comment for Testing", :user => creator
  @backlog_item.checklist_items.create :description => "First Checklist Item for Testing"
  @backlog_item.checklist_items.create :description => "Second Checklist Item for Testing"
end

When /^I view the item$/ do
  visit backlog_item_path(@backlog_item.id)
end

Then /^I should see the name of the item$/ do
  expect(page).to have_content(@backlog_item.name)
end

Then /^I should see the description of the item$/ do
  expect(page).to have_content(@backlog_item.description)
end

Then /^I should see when the item was created$/ do
  expect(page).to have_content(time_ago_in_words(@backlog_item.created_at))
end

Then /^I should see when the item was last updated$/ do
  expect(page).to have_content(time_ago_in_words(@backlog_item.updated_at))
end

Then /^I should see the status of the item$/ do
  expect(page).to have_content(@backlog_item.status.capitalize)
end

Then /^I should see what the item is labeled with$/ do
  @backlog_item.label_list.each do |label|
    expect(page).to have_content(label)
  end
end

Then /^I should see what projects the item belongs to$/ do
  @backlog_item.project_list.each do |project|
    expect(page).to have_content(project)
  end
end

Then /^I should see the item discussion$/ do
  @backlog_item.comments.each do |comment|
    expect(page).to have_content(comment.comment)
  end
end

Then /^I should see the position of the item in the backlog$/ do
  expect(page).to have_content(@backlog_item.position)
end

Then /^I should see who created the item$/ do
  expect(page).to have_content(@backlog_item.creator.email)
end

Then /^I should see who updated the item$/ do
  expect(page).to have_content(@backlog_item.updater.email)
end

Then /^I should see the checklist for the item$/ do
  @backlog_item.checklist_items.each do |checklist_item|
    expect(page).to have_content(checklist_item.description)
  end
end
