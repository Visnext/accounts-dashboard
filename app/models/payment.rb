class Payment < ApplicationRecord
	validates :amount, :paymentable_id, presence: true

	belongs_to :paymentable, polymorphic: true

	scope :payables, -> { where(paymentable_type: "Seller")}
	scope :recievables, -> { where(paymentable_type: "Buyer")}

	scope :cleared, -> { where(cleared: :true) }
	scope :unclear, -> { where(cleared: :false) }
end