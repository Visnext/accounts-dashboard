class TransactionsController < ApplicationController

	def receive_money
		@buyer = Buyer.find(params[:id])
		@transaction = Transaction.new
	end

	def received
		if params[:seller_id].present?
			seller = Seller.find(params[:seller_id])
			buyer = Buyer.find(params[:id])
			amount = params[:amount].to_i
			seller.update(amount_payable: (seller.amount_payable - amount))
			buyer.update(amount_recievable: (buyer.amount_recievable - amount))
			transaction = Transaction.new(from_type: buyer.class.name, from_id: buyer.id,
				 from_name: buyer.name, to_type: seller.class.name, to_id: seller.id,
				  to_name: seller.name, amount: amount)
			if transaction.save!
				redirect_to buyers_path, notice: "Completed"
			end
		end
	end

end