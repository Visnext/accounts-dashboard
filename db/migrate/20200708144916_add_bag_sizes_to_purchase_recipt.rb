class AddBagSizesToPurchaseRecipt < ActiveRecord::Migration[6.0]
  def change
  	add_column :purchase_recipts, :bag_array, :integer, array: true, default: []
  end
end
