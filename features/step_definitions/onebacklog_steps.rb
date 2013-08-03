include ActionView::Helpers::DateHelper

Given /^I am logged in$/  do
  email = 'testing@man.net'
  password = 'secretpass'
  user = User.create :email => 'me@example.com', :password => 'password longer', :password_confirmation => 'password longer'

  visit new_user_session_path
  fill_in "user_email", :with => user.email
  fill_in "user_password", :with => user.password
  click_button "Sign in"
end

Given /^a backlog item exists$/ do
  creator = User.create :email => 'creator@example.com', :password => 'password longer'
  updater = User.create :email => 'updater@example.com', :password => 'password longer'
  @current_worker = User.create :email => 'worker@example.com', :password => 'password longer'
  @backlog_item = BacklogItem.create(
    :name => 'Name for Testing',
    :description => 'Description for Testing',
    :created_at => Date.yesterday.yesterday,
    :updated_at => Date.today,
    :status => 'Status for Testing',
    :project_list => 'First Project for Testing, Second Project for Testing',
    :creator => creator,
    :updater => updater,
  )
  @backlog_item.comments.create :comment => "First Comment for Testing", :user => creator
  @backlog_item.comments.create :comment => "Second Comment for Testing", :user => creator
  @checklist_item = @backlog_item.checklist_items.create :description => "First Checklist Item for Testing"
  @backlog_item.checklist_items.create :description => "Second Checklist Item for Testing"
  @current_worker.assignments.create :backlog_item => @backlog_item
end

Given /^another backlog item exists$/ do
  @other_backlog_item = BacklogItem.create(
    :name => 'Other Name for Testing',
    :position => 1,
  )
  @backlog_item.update_attribute :position, 2
end

Given /^no backlog items$/ do
  BacklogItem.delete_all
end

When /^I view the item$/ do
  visit backlog_item_path(@backlog_item.id)
end

When /^I complete a checklist item$/ do
  check "First Checklist Item for Testing"
end

When /^I remove a checklist item$/ do
  page.find("#checklist_item_1_delete").click
end

When /^I edit the item description$/ do
  bip_area @backlog_item, :description, "edited description"
end

When /^I edit the item name$/ do
  bip_text @backlog_item, :name, "edited name"
end

When /^I edit a checklist item$/ do
  bip_text @checklist_item, :description, "edited checklist item description"
end

When /^I add a checklist item$/ do
  fill_in 'add_checklist_item_description', with: "new checklist item"
  page.evaluate_script "$('#new_checklist_item').submit()"
end

When /^I add a comment$/ do
  fill_in 'add_comment_message', with: "new comment message"
  page.evaluate_script "$('#new_comment').submit()"
end

When /^I view the backlog$/ do
  visit backlog_path
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

Then /^the item should be completed$/ do
  page.should have_field("First Checklist Item for Testing", :checked => true)
end

Then /^I should see who is working on the item$/ do
  expect(page).to have_content(@current_worker.email)
end

Then /^the item should be removed$/ do
  expect(page).to_not have_field("First Checklist Item for Testing")
end

Then /^the item description should be different$/ do
  expect(page).to have_content("edited description")
end

Then /^the item name should be different$/ do
  expect(page).to have_content("edited name")
end

Then /^the checklist item should be different$/ do
  expect(page).to have_content("edited checklist item description")
end

Then /^the new item should exist$/ do
  expect(page).to have_content("new checklist item")
end

Then /^the new comment should exist$/ do
  expect(page).to have_content("new comment message")
end

Then /^I should see the empty backlog message$/ do
  expect(page).to have_content("No items in the backlog")
end

Then /^I should see the item name$/ do
  expect(page).to have_content(@backlog_item.name)
end

Then /^the backlog is sorted$/ do
  expect(page.text).to match(/#{@other_backlog_item.name}.*#{@backlog_item.name}/)
end

Then /^I should see a link to the item$/ do
  expect(page).to have_link(@backlog_item.name, backlog_item_path(@backlog_item))
end
