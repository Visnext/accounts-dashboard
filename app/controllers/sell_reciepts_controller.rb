class SellRecieptsController < ApplicationController
	def new
		@inventory_item = InventoryItem.find(params[:id])
		@sell_reciept = SellReciept.new
	end

	def create
		debugger
		if params[:buyer_id].present?
			sell_reciept = SellReciept.new(sell_params)
		else
			redirect_to request.referrer, notice: sell_reciept.errors.full_messages.join(', ')
		end
		if sell_reciept.save!
			redirect_to inventory_items_path, notice: "Item Purchased!"
		else
			redirect_to request.referrer, notice: sell_reciept.errors.full_messages.join(', ')
		end
	end
		
	private
		def sell_params
			params.permit(:name, :unit, :quantity, :price_per_lbs, :buyer_id, :inventory_item_id)
		end
end