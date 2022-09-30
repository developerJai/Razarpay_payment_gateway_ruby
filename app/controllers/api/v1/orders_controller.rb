class Api::V1::OrdersController < ApplicationController
   before_action :check_logged_user

	def create
	    if @user.present?
	     amount = params[:amount].to_i * 100
	     @order = Payments::Create.call(@user, amount)
	     render json: @order, each_serializer: OrderSerializer
	    else 
	     render :json=>{code:400,message:"Something Went Wrong"}
	    end
	end


end
