class Api::V1::SessionsController < ApplicationController

	def login
	  @user = User.find_by_email(params[:email]) if params[:email].present?
	  if @user && @user.authenticate(params[:password])
	    login_user
	  else
	    sendResponse('unauthorized',"User",{})
	  end	   
	end

	

	def signup
	    @user = User.find_by_email(params[:email]) if params[:email].present?
	    	@user = User.create!({
	                name: params[:name],
	                contact:params[:contact],
	                email: params[:email],
	                role: "user",
	                status:true,
	                password: params[:password]
	              })	
	    	login_user  
	end


  private

  def updateDevice
    @user.sessions.create!({
      device_id: request.headers["device_token"],
      device_type: request.headers["device_type"],
      device_model: request.headers["device_model"],
      timeZone: request.headers["time_zone"]
    })
  end


  def login_user
    userSession = updateDevice
    sendResponse('created',"User",{user: @user.as_json(:except=>[:password_digest,:confirm_otp,:created_at,:updated_at,:latitude,:longitude]).merge(accessToken:userSession.token,check_in:check_in)})
  end

end
