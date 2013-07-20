Given /^a backlog item exists$/ do
  @backlog_item = BacklogItem.create(
    :name => 'Name for Testing',
    :description => 'Description for Testing',
    :created_at => Date.yesterday,
    :updated_at => Date.today
  )
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
  expect(page).to have_content(I18n.l(@backlog_item.created_at, :format => :notime))
end

Then /^I should see when the item was last updated$/ do
  expect(page).to have_content(I18n.l(@backlog_item.updated_at, :format => :notime))
end
