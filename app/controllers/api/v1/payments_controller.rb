class Api::V1::PaymentsController < ApplicationController
	def order_create 
		begin
		    @user = User.find_by_id(params[:user_id])
		    p @user
			amount = params[:amount].to_i * 100
			@order = Payments::Create.call(@user, amount)
								
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
