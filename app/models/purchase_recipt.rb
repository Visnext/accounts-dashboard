class PurchaseRecipt < ApplicationRecord
	attr_accessor :inventory_item_id

	validates :name, :quantity, :price_per_lbs, :seller_id, presence: true

	has_one :payable
	belongs_to :seller
	
	after_create :update_inventory
	after_create :add_payable

	private

	def update_inventory
		item = InventoryItem.find(inventory_item_id)
		item.update(quantity: item.quantity + self.quantity)
	end

	def add_payable
		Payable.create(amount: self.quantity * self.price_per_lbs, 
									  seller_id: self.seller_id,
									  purchase_recipt_id: self.id)
	end
end