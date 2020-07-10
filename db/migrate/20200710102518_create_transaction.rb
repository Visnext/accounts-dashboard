class CreateTransaction < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
    	t.references :to, polymorphic: true
    	t.references :from, polymorphic: true
    	t.integer :amount
    	t.timestamps
    end
  end
end
