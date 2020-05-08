class Payable < ApplicationRecord
	validates :amount, :seller_id, :purchase_recipt_id, presence: true

	belongs_to :purchase_recipt
	belongs_to :seller

	scope :paid, -> { where(paid: :true) }
	scope :unpaid, -> { where(paid: :false) }
end