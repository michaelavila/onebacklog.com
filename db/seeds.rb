# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
BacklogItem.delete_all
Comment.delete_all
ChecklistItem.delete_all
Assignment.delete_all

user = User.create :email => 'me@onebacklog.com', :password => 'password longer'
worker = User.create :email => 'worker@onebacklog.com', :password => '123456789'

# View Backlog Item

view_item = BacklogItem.create(
  :id => 1,
  :name => "View backlog item",
  :description => "A page should be dedicated to each individual backlog item. On this page you should be able to view the short name, long description, current status, position in backlog, discussions between team members, creator, updater, timestamps, project tags and whatever else makes sense. Most of these items can be edited from this page. It should also look nice.",
  :status => "in iteration, finished",
  :project_list => "onebacklog",
  :position => 1,
  :creator => user,
  :updater => user,
)
view_item.comments.create :comment => "We should include task lists", :user => user
view_item.comments.create :comment => "Maybe there should be multiple task lists?", :user => user

completed = ['name', 'position', 'description', 'projects', 'status', 'discussion', 'checklist']
['name', 'position', 'description', 'projects', 'status', 'discussion', 'checklist', 'workers'].each do |checklist_item|
  view_item.checklist_items.create :description => checklist_item, :completed => completed.include?(checklist_item)
end

Assignment.create :user_id => worker.id, :backlog_item => view_item

# Edit Backlog Item

edit_item = BacklogItem.create(
  :id => 2,
  :name => "Edit backlog item",
  :description => "The view backlog item page should double as an edit page",
  :status => "in iteration, started but not finished",
  :project_list => "onebacklog",
  :position => 1,
  :creator => user,
  :updater => user,
)

completed = []
['name', 'position', 'description', 'projects', 'status', 'discussion', 'checklist', 'workers'].each do |checklist_item|
  edit_item.checklist_items.create :description => checklist_item, :completed => completed.include?(checklist_item)
end
