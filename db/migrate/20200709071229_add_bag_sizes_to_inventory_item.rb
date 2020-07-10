class AddBagSizesToInventoryItem < ActiveRecord::Migration[6.0]
  def change
  	add_column :inventory_items, :bag_array, :integer, array: true, default: []
  end
end
