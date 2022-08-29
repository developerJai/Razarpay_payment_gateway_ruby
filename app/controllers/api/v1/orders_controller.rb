class Api::V1::OrdersController < ApplicationController
   protect_from_forgery with: :null_session
   before_action :amount

	def create
		amount = params[:amount].to_i * 100
	    if @user.present?
	     @order = Order.create(amount:params[:amount],user_id:@user.id)
	     render :json=>{code:200,message:"success",order:@order}
	    else 
	     render :json=>{code:400,message:"Something Went Wrong"}
	    end
	end


	def amount
		amount = params[:amount].to_i * 100
	end

end
