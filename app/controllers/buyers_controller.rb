class BuyersController < ApplicationController
	before_action :set_buyer, only: %i[edit show update destroy]
	def new
		@buyer = Buyer.new
	end

	def create
		buyer = Buyer.new(buyer_params)
		if buyer.save
			redirect_to buyers_path, notice:"Created successfully"
		else
			redirect_to request.referrer, notice: "Something Went Wrong!"
		end
	end

	def index
		@buyers = Buyer.all
	end

	def edit
	end

	def update
		respond_to do |format|
			if @seller.update(seller_params)
	      format.html { redirect_to sellers_path, notice: "Seller Updated!" }
	    else
	      format.html { redirect_to request.referrer, notice: "Something Went Wrong!" }
	    end
	  end
	end

	def destroy
		respond_to do |format|
			if @buyer.delete
	      format.html { redirect_to sellers_path, notice: "Seller Deleted!" }
	    else
	      format.html { redirect_to request.referrer, notice: "Something Went Wrong!" }
	    end
	  end
	end

	private

		def set_buyer
			@buyer = Buyer.find(params[:id])
		end

		def buyer_params
    	params.require(:buyer).permit(:name, :email, :phone, :country)
  	end
end