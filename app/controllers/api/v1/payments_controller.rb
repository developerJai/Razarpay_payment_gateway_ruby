class Api::V1::PaymentsController < ApplicationController
	before_action :check_logged_user


	def verify_payment
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
