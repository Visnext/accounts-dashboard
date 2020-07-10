class BanksController < ApplicationController
	def new
		@bank = Bank.new
	end

	def create
		bank = Bank.new(params.require(:bank).permit(:name, :current_balance))
		if bank.save!
			flash[:notice] = "Created successfully"
			redirect_to banks_path
		else
			flash[:notice] = "Error Creating Bank"
			redirect_to new_bank_path 
		end
	end

	def index
		@banks = Bank.all
	end

	def destroy
		bank = Bank.find(params[:id])
		if bank.delete
			redirect_to banks_path, notice: "Deleted successfully"
		else
			redirect_to request.referrer, notice: "Something Went Wrong!"
		end
	end
end