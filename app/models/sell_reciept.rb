class SellReciept < ApplicationRecord
	attr_accessor :inventory_item_id
	validates :name, :quantity, :price_per_lbs, :buyer_id, presence: true
	enum unit: [ :ton, :bag ]
	belongs_to :buyer


	after_create :remove_from_inventory, :add_recieveable

	private
		def remove_from_inventory
			item = InventoryItem.find(inventory_item_id)
			item.update(quantity: item.quantity - self.quantity)
		end

		def add_recieveable
		Payment.create(amount: self.quantity * self.price_per_lbs, 
									  paymentable_id: self.buyer.id,
									  paymentable_type: self.buyer.class.name)
	end
end