class Buyer < ApplicationRecord
	validates :name, :email, presence: true
	has_many :sell_reciepts
end