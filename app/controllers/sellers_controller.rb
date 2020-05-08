class SellersController < ApplicationController
	before_action :set_seller, only: %i[edit show update destroy]

	def index
		@sellers = Seller.all
	end

	def new
		@seller = Seller.new
	end

	def create
		@seller = Seller.new(seller_params)
		respond_to do |format|
	    if @seller.save
	      format.html { redirect_to sellers_path, notice: "Seller Created!" }
	    else
	      format.html { redirect_to request.referrer, notice: "Something Went Wrong!" }
	    end
		end
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
			if @seller.delete
	      format.html { redirect_to sellers_path, notice: "Seller Deleted!" }
	    else
	      format.html { redirect_to request.referrer, notice: "Something Went Wrong!" }
	    end
	  end
	end

private
	def set_seller
		@seller = Seller.find(params[:id])
	end

  def seller_params
    params.require(:seller).permit(:name, :email, :phone, :country)
  end
end