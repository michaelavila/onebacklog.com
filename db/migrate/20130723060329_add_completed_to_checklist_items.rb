class AddCompletedToChecklistItems < ActiveRecord::Migration
  def change
    add_column :checklist_items, :completed, :boolean, :default => false
  end
end
