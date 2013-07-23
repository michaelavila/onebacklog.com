class BacklogItem < ActiveRecord::Base
  has_many :checklist_items
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'
  acts_as_taggable_on :labels, :projects
  acts_as_commentable
end
