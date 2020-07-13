class TransactionsController < ApplicationController

	def index
		@transactions = Transaction.all
	end

	def receive_money
		@buyer = Buyer.find(params[:id])
		@transaction = Transaction.new
	end

	def received
		if params[:seller_id].present?
			if params[:from_bank_view].present?
				seller = Seller.find(params[:seller_id])
				bank = Bank.find(params[:id])
				amount = params[:amount].to_i
				seller.update(amount_payable: (seller.amount_payable - amount))
				bank.update(current_balance: (bank.current_balance - amount))
				transaction = Transaction.new(from_type: bank.class.name, from_id: bank.id,
					 from_name: bank.name, to_type: seller.class.name, to_id: seller.id,
					  to_name: seller.name, amount: amount)
				if transaction.save!
					redirect_to banks_path, notice: "Paid to seller from bank successfully"
				end
			else
				seller = Seller.find(params[:seller_id])
				buyer = Buyer.find(params[:id])
				amount = params[:amount].to_i
				seller.update(amount_payable: (seller.amount_payable - amount))
				buyer.update(amount_recievable: (buyer.amount_recievable - amount))
				transaction = Transaction.new(from_type: buyer.class.name, from_id: buyer.id,
					 from_name: buyer.name, to_type: seller.class.name, to_id: seller.id,
					  to_name: seller.name, amount: amount)
				if transaction.save!
					redirect_to buyers_path, notice: "Paid to seller from bank successfully"
				end
			end
		elsif params[:bank_id].present?
			bank = Bank.find(params[:bank_id])
			buyer = Buyer.find(params[:id])
			amount = params[:amount].to_i
			buyer.update(amount_recievable: (buyer.amount_recievable - amount))
			bank.update(current_balance: (bank.current_balance + amount))
			transaction = Transaction.new(from_type: buyer.class.name, from_id: buyer.id,
				 from_name: buyer.name, to_type: bank.class.name, to_id: bank.id,
				  to_name: bank.name, amount: amount)
			if transaction.save!
				redirect_to buyers_path, notice: "Added to bank successfully"
			end
		end
	end

	def pay_money
		@bank = Bank.find(params[:id])
	end

end