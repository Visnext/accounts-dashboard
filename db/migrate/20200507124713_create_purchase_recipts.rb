class CreatePurchaseRecipts < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_recipts do |t|
    	t.string :name
      t.integer :quantity
      t.float :price_per_lbs
      t.references :seller, index: true

      t.timestamps
    end
  end
end
