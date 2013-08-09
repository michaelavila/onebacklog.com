class BacklogItem < ActiveRecord::Base
  has_many :checklist_items
  has_many :assignments
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'
  acts_as_taggable_on :projects
  acts_as_commentable
  default_scope -> { order('position') }
end
