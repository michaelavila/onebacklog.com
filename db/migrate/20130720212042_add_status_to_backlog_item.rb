class AddStatusToBacklogItem < ActiveRecord::Migration
  def change
    add_column :backlog_items, :status, :string
  end
end
