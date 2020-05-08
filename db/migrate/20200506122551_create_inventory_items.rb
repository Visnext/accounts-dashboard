class CreateInventoryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_items do |t|
    	t.string :name
      t.integer :quantity
      t.float :price_per_lbs

      t.timestamps
    end
  end
end
