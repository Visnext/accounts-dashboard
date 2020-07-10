class SellRecieptsController < ApplicationController
	def new
		@inventory_item = InventoryItem.find(params[:id])
		@sell_reciept = SellReciept.new
	end

	def create
		if params[:seller_id].present?
			@sell_reciept = SellReciept.new(sell_params)
		else
			redirect_to request.referrer, notice: @seller.errors.full_messages.join(', ')
		end
		if @purchase_recipt.save!
			redirect_to inventory_items_path, notice: "Item Purchased!"
		else
			redirect_to request.referrer, notice: @purchase_recipt.errors.full_messages.join(', ')
		end
	end
		
	private
		def recipt_params
			params.permit(:name, :unit, :quantity, :price_per_lbs, :buyer_id, :inventory_item_id)
		end
end