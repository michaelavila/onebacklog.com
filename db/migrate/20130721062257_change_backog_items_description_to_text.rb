class ChangeBackogItemsDescriptionToText < ActiveRecord::Migration
  def change
    change_column :backlog_items, :description, :text
  end
end
