class CreateChecklistItems < ActiveRecord::Migration
  def change
    create_table :checklist_items do |t|
      t.integer :backlog_item_id
      t.text :description
    end
  end
end
