Given /^a backlog item exists$/ do
  @backlog_item = BacklogItem.create(
    :name => 'Name for Testing',
    :description => 'Description for Testing',
    :created_at => Date.yesterday,
    :updated_at => Date.today,
    :status => 'Status for Testing'
  )
  @backlog_item.label_list = 'First Label for Testing, Second Label for Testing'
  @backlog_item.save
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

Then /^I should see the status of the item$/ do
  expect(page).to have_content(@backlog_item.status)
end

Then /^I should see what the item is labeled with$/ do
  @backlog_item.label_list.each do |label|
    expect(page).to have_content(label)
  end
end
