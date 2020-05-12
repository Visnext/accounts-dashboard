class PaymentsController < ApplicationController
	before_action :set_payment, only: %i[edit show update destroy cleared]

	def index
		if params[:status].present? || params[:category].present?
			filter
		else
			@payments = Payment.all
		end
	end

	def cleared
		respond_to do |format|
			if @payment.update(cleared: true, cleared_at: Time.now)
				format.html { redirect_to payments_path, notice: "Payment Status Updated!" }
	    else
	      format.html { redirect_to request.referrer, notice: @payment.errors.full_messages.join(', ') }
	    end
	  end
	end

	private

	def set_payment
		@payment = Payment.find(params[:id]||params[:payment_id])
	end

	def filter
		@category_payments = params[:category].present? ? select_category : Payment.all
		@payments = params[:status].present? ? select_status : @category_payments
	end

	def select_category
		data =  if params[:category] == "payables"
							Payment.payables
						elsif params[:category] == "recievables"
							Payment.recievables							 	 
						end
	end

	def select_status
		data = params[:status] == "cleared" ? @category_payments.cleared : @category_payments.unclear
	end
end