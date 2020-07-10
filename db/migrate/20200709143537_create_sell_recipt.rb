class CreateSellRecipt < ActiveRecord::Migration[6.0]
  def change
    create_table :sell_reciepts do |t|
    	t.string :name
    	t.string :unit
      t.integer :quantity
      t.float :price_per_lbs
      t.references :buyer, index: true
      t.timestamps
    end
  end
end
