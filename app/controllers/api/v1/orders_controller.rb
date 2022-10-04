class Api::V1::OrdersController < ApplicationController
   before_action :check_logged_user

	def create
	     @order = Payments::Create.call(@user, params[:amount], params[:currency])
	     render json: @order, each_serializer: OrderSerializer
	end


end
