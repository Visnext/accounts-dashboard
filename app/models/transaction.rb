class Transaction < ApplicationRecord
	validates :amount, presence: true
	belongs_to :to, polymorphic: true
	belongs_to :from, polymorphic: true
end