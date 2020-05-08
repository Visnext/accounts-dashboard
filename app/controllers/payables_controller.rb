class PayablesController < ApplicationController
	before_action :set_payable, only: %i[edit show update destroy paid]

	def index
		if params[:filter].present?
			@payables = params[:filter] == "paid" ? Payable.paid : Payable.unpaid
		else
			@payables = Payable.all
		end
	end

	def paid
		respond_to do |format|
			if @payable.update(paid: true, paid_at: Time.now)
				format.html { redirect_to payables_path, notice: "Payment Status Updated!" }
	    else
	      format.html { redirect_to request.referrer, notice: @payable.errors.full_messages.join(', ') }
	    end
	  end
	end

	private

	def set_payable
		@payable = Payable.find(params[:id]||params[:payable_id])
	end
end