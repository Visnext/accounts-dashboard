class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
    	t.float :amount
      t.boolean :cleared, default: false
      t.datetime :cleared_at
      t.references :paymentable, polymorphic: true

      t.timestamps
    end
  end
end
