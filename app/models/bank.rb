class Bank < ApplicationRecord
	validates :name, presence: true
	before_save :add_balance

	private
	
	 	def add_balance
	 		unless self.current_balance.present?
	 			self.current_balance = 0
	 		end
	 	end
end