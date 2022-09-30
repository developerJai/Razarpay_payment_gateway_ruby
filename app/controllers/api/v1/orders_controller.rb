class Api::V1::OrdersController < ApplicationController
   protect_from_forgery with: :null_session
   before_action :amount
   before_action :require_visitor
   add before_action :authenticate_user!
   
	def create
	    if @user.present?
	     @order = Payments::Create.call(@user, params)
	     render json: @order, each_serializer: OrderSerializer
	    else 
	     render :json=>{code:400,message:"Something Went Wrong"}
	    end
	end


	def amount
		amount = params[:amount].to_i * 100
	end

end
