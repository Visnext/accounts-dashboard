class CreatePayables < ActiveRecord::Migration[6.0]
  def change
    create_table :payables do |t|
    	t.float :amount
      t.boolean :paid, default: false
      t.datetime :paid_at
      t.references :seller, index: true
      t.references :purchase_recipt, index: true

      t.timestamps
    end
  end
end
