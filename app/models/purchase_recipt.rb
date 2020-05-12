class PurchaseRecipt < ApplicationRecord
	attr_accessor :inventory_item_id

	validates :name, :quantity, :price_per_lbs, :seller_id, presence: true

	belongs_to :seller
	
	after_create :update_inventory
	after_create :add_payable

	private

	def update_inventory
		item = InventoryItem.find(inventory_item_id)
		item.update(quantity: item.quantity + self.quantity)
	end

	def add_payable
		Payment.create(amount: self.quantity * self.price_per_lbs, 
									  paymentable_id: self.seller.id,
									  paymentable_type: self.seller.class.name)
	end
end