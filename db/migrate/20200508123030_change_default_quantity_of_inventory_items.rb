class ChangeDefaultQuantityOfInventoryItems < ActiveRecord::Migration[6.0]
  def change
  	change_column :inventory_items, :quantity, :integer, default: 0
  end
end
