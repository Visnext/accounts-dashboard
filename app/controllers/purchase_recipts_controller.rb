class PurchaseReciptsController < ApplicationController
	before_action :set_inventory_item, only: %i[new create]

	def new
		@purchase_recipt = PurchaseRecipt.new
	end

	def create
		if params[:seller_id].present?
			@purchase_recipt = PurchaseRecipt.new(recipt_params)
		else
			@seller = Seller.new(seller_params)
			@purchase_recipt = PurchaseRecipt.new(recipt_params_without_seller)
			if @seller.save				
				@purchase_recipt[:seller_id] = @seller.id
			else
				redirect_to request.referrer, notice: @seller.errors.full_messages.join(', ')
			end
		end
		respond_to do |format|
			if @purchase_recipt.save!
				format.html { redirect_to inventory_items_path, notice: "Item Purchased!" }
			else
				format.html { redirect_to request.referrer, notice: @purchase_recipt.errors.full_messages.join(', ') }
			end
		end
	end

	private

	def set_inventory_item
		@inventory_item = InventoryItem.find(params[:inventory_item_id])
	end

	def seller_params
		params.require(:seller).permit(:name, :email, :phone, :country)
	end

	def recipt_params
		params.permit(:name, :bag_array, :quantity, :price_per_lbs, :seller_id, :inventory_item_id)
	end

	def recipt_params_without_seller
		params.permit(:name, :bag_array, :quantity, :price_per_lbs, :inventory_item_id)
	end
end