class AddCreatorToBacklogItem < ActiveRecord::Migration
  def change
    add_column :backlog_items, :creator_id, :integer
  end
end
