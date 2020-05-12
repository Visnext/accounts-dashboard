class Seller < ApplicationRecord
	validates :name, :email, presence: true
	
	has_many :purchase_recipts
	has_many :payments, as: :paymentable
end