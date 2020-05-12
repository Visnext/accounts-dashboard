class ChangeDefaultQuantityOfInventoryItems < ActiveRecord::Migration[6.0]
  def up
  	change_column :inventory_items, :quantity, :integer, default: 0
  end

  def down
  	change_column :inventory_items, :quantity, :integer, default: 0
  end
end
