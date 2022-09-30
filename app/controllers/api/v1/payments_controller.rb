class Api::V1::PaymentsController < ApplicationController
	before_action :check_logged_user


	def verify_payment
		@order = @user.orders.where(gatewayOrderId: params[:gateway_order_id]).first
		if @order.present?
			@order.update(razorpay_payment_id: params[:razorpay_payment_id], razorpay_signature: params[:razorpay_signature], razorpay_order_id: params[:razorpay_order_id])
			 @response = Payments::Verify.call(@order)
			
			render :json=>{code:200,message:"success",razorpay_response:@response}

		else
			render :json=>{code:400,message:"Something Went Wrong"}
		end	
	end


end
