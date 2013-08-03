# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_or_create_by_email 'me@onebacklog.com'
worker = User.find_or_create_by_email 'worker@onebacklog.com'

BacklogItem.delete_all
Comment.delete_all
Assignment.delete_all
ChecklistItem.delete_all

# View Backlog Item

view_item = BacklogItem.create(
  :id => 1,
  :name => "View backlog item",
  :description => "A page should be dedicated to each individual backlog item. On this page you should be able to view the short name, long description, current status, position in backlog, discussions between team members, creator, updater, timestamps, project tags and whatever else makes sense. Most of these items can be edited from this page. It should also look nice.",
  :status => "in iteration, started but not finished",
  :project_list => "onebacklog",
  :position => 1,
  :creator => user,
  :updater => user,
)
view_item.comments.create :comment => "We should include task lists", :user => user
view_item.comments.create :comment => "Maybe there should be multiple task lists?", :user => user

completed = ['name', 'position', 'description', 'projects', 'status', 'discussion', 'checklist', 'workers']
['name', 'position', 'description', 'projects', 'status', 'discussion', 'checklist', 'workers', 'empty states for workers, discussion, checklist, projects, and description'].each do |checklist_item|
  view_item.checklist_items.create :description => checklist_item, :completed => completed.include?(checklist_item)
end

Assignment.create :user_id => worker.id, :backlog_item => view_item

# Edit Backlog Item

edit_item = BacklogItem.create(
  :id => 2,
  :name => "Edit backlog item",
  :description => "When looking at a backlog item you should be able to manage the checklist, take part in the discussion, associate with projects, and edit the description and name. These edits should also affect the updated part of the item.",
  :status => "in iteration, started but not finished",
  :project_list => "onebacklog",
  :position => 2,
  :creator => user,
  :updater => user,
)

completed = ['toggle checklist item', 'edit name', 'edit description', 'remove checklist item', 'edit checklist item', 'add checklist item']
['edit name', 'edit description', 'add projects', 'remove projects', 'add to discussion', 'add checklist item', 'toggle checklist item', 'remove checklist item', 'edit checklist item', 'edits change updater'].each do |checklist_item|
  edit_item.checklist_items.create :description => checklist_item, :completed => completed.include?(checklist_item)
end

position = 3
['Add item', 'Remove item', 'View backlog', 'Prioritize backlog', 'Complete item', 'View goal line', 'Change goal line', 'View previous week progress markers', 'Mention team member', 'Receive mention notifications', 'Receive status notifications', 'View /me page', 'Next item from /me page'].each do |item|
  BacklogItem.create(
    :name => item,
    :description => item,
    :position => position,
    :status => 'Not in iteration. Not started',
    :creator => user,
    :updater => user,
    :project_list => "onebacklog",
  )
  position += 1
end
