class Api::V1::PaymentsController < ApplicationController
	protect_from_forgery with: :null_session
	before_action :require_visitor
    add before_action :authenticate_user!

	def order_create 
		begin
			amount = params[:amount].to_i * 100
			@order = Payments::Create.call(@user, params)
								
			render json: @order, each_serializer: OrderSerializer
		rescue Exception => e
			render :json => {code: 400, message:e.message}
		end
	end


	def verify_payment
		@order = @user.restaurant_orders.where(gatewayOrderId: params[:gateway_order_id]).first
		if @order.present?
			@order.update(razorpay_payment_id: params[:razorpay_payment_id], razorpay_signature: params[:razorpay_signature], razorpay_order_id: params[:razorpay_order_id])
			 @response = Payments::Verify.call(@order)
			
			render :json=>{code:200,message:"success",razorpay_response:@response}

		else
			render :json=>{code:400,message:"Something Went Wrong"}
		end	
	end


end
