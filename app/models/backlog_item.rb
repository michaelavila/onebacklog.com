class BacklogItem < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  acts_as_taggable_on :labels, :projects
  acts_as_commentable
end
