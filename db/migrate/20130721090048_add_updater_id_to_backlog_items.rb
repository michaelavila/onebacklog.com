class AddUpdaterIdToBacklogItems < ActiveRecord::Migration
  def change
    add_column :backlog_items, :updater_id, :integer
  end
end
