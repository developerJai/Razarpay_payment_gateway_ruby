class Api::V1::OrdersController < ApplicationController
	before_action :check_logged_user

	def create
		# From here we will create an order and a payment will be initiated at razarpay.
		# Razarpay will provide a payment link or payment form (if we are using js) to make the payment.
		@order = Payments::Create.call(@user, params[:amount], params[:currency])
		render json: @order, each_serializer: OrderSerializer
	end


end
