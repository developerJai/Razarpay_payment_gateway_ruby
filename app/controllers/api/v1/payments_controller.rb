class Api::V1::PaymentsController < ApplicationController
	protect_from_forgery with: :null_session
	
	def order_create 
		begin
			amount = params[:amount].to_i * 100
			@user = User.find_by_id(params[:user_id])
			@order = Order.create(amount:params[:amount],user_id:@user.id)
			Razorpay.setup('rzp_test_6YnqfdYKC4I8BP', 'puUqR8QDyjQe4QdpNatPOVwT')
			Razorpay.headers = {"Content-type" => "application/json"}

			para_attr = {"amount": amount,"currency": "INR","receipt": "#{@order.id}"}

			order = Razorpay::Order.create(para_attr.to_json)
					
			@order.update(gateway_order_id: order.id)

			Razorpay.headers = {"Content-type" => "application/json"}

			para_attr = {
			 "amount": amount,
			 "currency": "INR",
			 "accept_partial": false,
			 "first_min_partial_amount": 100,
								  "description": "Restaurant Order",
								  "customer": {
								    "name": @user.name,
								    "email": @user.email,
								    "contact": @user.contact
								  },
								  "notify": {
								    "sms": true,
								    "email": true
								  },
								  "reminder_enable": true,
								  "callback_url": "https://example-callback-url.com/",
								  "callback_method": "get"
						}

			payment_link = Razorpay::PaymentLink.create(para_attr.to_json)
					
			@order.update(Paylink_id: payment_link.id,payment_link:payment_link.short_url)
								
			render :json=>{code:200,message:"success",order:@order}
		rescue Exception => e
				logger.info "=====#{e}"
			render :json => {code: 400, message:e.message}
		end
	end


	def verify_payment
		@order = @user.restaurant_orders.where(gatewayOrderId: params[:gatewayOrderId]).first
		if @order.present?
			@order.update(razorpay_payment_id: params[:razorpay_payment_id], razorpay_signature: params[:razorpay_signature], razorpay_order_id: params[:razorpay_order_id])
			Razorpay.setup('rzp_test_6YnqfdYKC4I8BP', 'puUqR8QDyjQe4QdpNatPOVwT')
						Razorpay.headers = {"Content-type" => "application/json"}

						payment_response = {"razorpay_order_id": params[:razorpay_order_id],"razorpay_payment_id": params[:razorpay_payment_id],"razorpay_signature": params[:razorpay_signature]}
			@response = Razorpay::Utility.verify_payment_signature(payment_response)
			if @response != true
				@order.destroy
			end
			render :json=>{code:200,message:"success",razorpay_response:@response}

		else
			render :json=>{code:400,message:"Something Went Wrong"}
		end	
	end


end
