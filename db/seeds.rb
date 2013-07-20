# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BacklogItem.remove_all

BacklogItem.create(
  :id => 1,
  :name => "Really important seed item",
  :description => "Well, if you didn't notice, it's really important.",
  :status => "in iteration, not started",
  :project_list => "Really important project",
  :label_list => "not-real"
)
