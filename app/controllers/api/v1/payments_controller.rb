class Api::V1::PaymentsController < ApplicationController
	before_action :check_logged_user

	def verify_payment
		# Request will receive here after payment status update (completed/failed)
		# This is working like as webhook in which Razoropay signature of payment will be received
		# Signature will be verified from razorpay and order will proceed on the bases of response
		begin
			@order = Order.where(gateway_order_id: params[:gateway_order_id]).first
			if @order.present?
				@order.update(razorpay_signature: params[:razorpay_signature])
				@response = Payments::Verify.call(@order)	
				render :json=>{code:200,message:"success",razorpay_response:@response}
			else
				render :json=>{code:400,message:"Something Went Wrong"}
			end	
		rescue Exception => e
			render :json => {code: 400, message:e.message}
		end	
	end

end
