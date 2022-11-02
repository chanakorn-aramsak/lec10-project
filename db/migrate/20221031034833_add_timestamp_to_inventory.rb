class AddTimestampToInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :timestamp, :Time
  end
end
