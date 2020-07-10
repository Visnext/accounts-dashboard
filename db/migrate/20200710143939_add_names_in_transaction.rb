class AddNamesInTransaction < ActiveRecord::Migration[6.0]
  def change
  	add_column :transactions, :to_name, :string
  	add_column :transactions, :from_name, :string
  end
end
