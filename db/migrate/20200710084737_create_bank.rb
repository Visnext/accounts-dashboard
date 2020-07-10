class CreateBank < ActiveRecord::Migration[6.0]
  def change
    create_table :banks do |t|
    	t.string :name
    	t.integer :current_balance
    	t.timestamps
    end
  end
end
