class PurchaseRecipt < ApplicationRecord
	attr_accessor :inventory_item_id

	validates :name, :quantity, :price_per_lbs, :seller_id, presence: true

	belongs_to :seller
	
	after_create :update_inventory
	after_create :add_payable

	private

	def update_inventory
		bag_array = []
		item = InventoryItem.find(inventory_item_id)
		if item.bag_array.present?
			array = self.bag_array
			array.slice!(array.length-1)
			array.slice!(array.length-1)
			array.slice!(0..1)
			array_new = array.split('],[')
			array_new.each do |ar|
				arr = ar.split(',')
				bag_array.push([arr.first.to_i,arr.second.to_i])
			end
			for i in 0..bag_array.length-1
				bag_array[i][1] = item.bag_array[i][1] + bag_array[i][1]
			end 
		else
			array = self.bag_array
			array.slice!(array.length-1)
			array.slice!(array.length-1)
			array.slice!(0..1)
			array_new = array.split('],[')
			array_new.each do |ar|
				arr = ar.split(',')
				bag_array.push([arr.first,arr.second])
			end
		end
		item.update(quantity: item.quantity + self.quantity, bag_array: bag_array)
	end

	def add_payable
		Payment.create(amount: self.quantity * self.price_per_lbs, 
									  paymentable_id: self.seller.id,
									  paymentable_type: self.seller.class.name)
	end
end
