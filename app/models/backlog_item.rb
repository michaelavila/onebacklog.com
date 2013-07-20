class BacklogItem < ActiveRecord::Base
  acts_as_taggable_on :labels, :projects
end
