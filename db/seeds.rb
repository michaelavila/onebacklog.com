# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

user = User.create :email => 'me@onebacklog.com', :password => 'password longer'

BacklogItem.delete_all
Comment.delete_all

item = BacklogItem.create(
  :id => 1,
  :name => "View backlog item",
  :description => "A page should be dedicated to each individual backlog item. On this page you should be able to view the short name, long description, current status, position in backlog, discussions between team members, creator, updater, timestamps, label tags, project tags and whatever else makes sense. Most of these items can be edited from this page. It should also look nice.",
  :status => "in iteration, started but not finished",
  :project_list => "onebacklog",
  :label_list => "item, backlog, core",
  :position => 1,
  :creator => user,
)
item.comments.create :comment => "We should include task lists"
