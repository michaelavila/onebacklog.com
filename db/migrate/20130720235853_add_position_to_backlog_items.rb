class AddPositionToBacklogItems < ActiveRecord::Migration
  def change
    add_column :backlog_items, :position, :integer
  end
end
