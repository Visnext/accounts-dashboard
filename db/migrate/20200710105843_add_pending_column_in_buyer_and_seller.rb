class AddPendingColumnInBuyerAndSeller < ActiveRecord::Migration[6.0]
  def change
  	add_column :buyers, :amount_recievable, :integer
  	add_column :sellers, :amount_payable, :integer
  end
end
