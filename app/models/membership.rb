class Membership < ActiveRecord::Base
  belongs_to :backlog_item
  belongs_to :user
end
