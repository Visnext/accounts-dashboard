class InventoryItem < ApplicationRecord
	validates :name, :price_per_lbs, presence: true
end