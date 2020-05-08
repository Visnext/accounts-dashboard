class InventoryItemsController < ApplicationController
	before_action :set_inventory_item, only: %i[edit show update destroy purchase]

	def index
		@inventory_items = InventoryItem.all
	end

	def new
		@inventory_item = InventoryItem.new
	end

	def create
		@inventory_item = InventoryItem.new(inventory_item_params)
		respond_to do |format|
	    if @inventory_item.save
	      format.html { redirect_to inventory_items_path, notice: "Inventory Item Created!" }
	    else
	      format.html { redirect_to request.referrer, notice: "Something Went Wrong!" }
	    end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @inventory_item.update(inventory_item_params)
	      format.html { redirect_to inventory_items_path, notice: "Inventory Item Updated!" }
	    else
	      format.html { redirect_to request.referrer, notice: "Something Went Wrong!" }
	    end
	  end
	end

	def destroy
		respond_to do |format|
			if @inventory_item.delete
	      format.html { redirect_to inventory_items_path, notice: "Inventory Item Deleted!" }
	    else
	      format.html { redirect_to request.referrer, notice: "Something Went Wrong!" }
	    end
	  end
	end

	def purchase

	end

	def store
		recipt = PurchaseRecipt.new()
		debugger
	end

private
	def set_inventory_item
		@inventory_item = InventoryItem.find(params[:id])
	end

  def inventory_item_params
    params.require(:inventory_item).permit(:name, :quantity, :price_per_lbs)
  end

  def purchase_item_params
  	params.permit(:name)
  end
end