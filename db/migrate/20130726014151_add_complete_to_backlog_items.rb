class AddCompleteToBacklogItems < ActiveRecord::Migration
  def change
    add_column :backlog_items, :complete, :boolean, :default => false
  end
end
