class Api::V1::SessionsController < ApplicationController

	def login
	  @user = User.find_by_email(params[:email]) if params[:email].present?
	  if @user && @user.authenticate(params[:password])
	  	if @user.sessions.present?
	  		@user.sessions.destroy_all
	  	end
	    loginUser
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
	    	loginUser  
	end


private

  def updateDevice
    @user.sessions.create!({
      device_id: request.headers["deviceToken"],
      device_type: request.headers["deviceType"],
      device_model: request.headers["deviceModel"],
      timeZone: request.headers["timeZone"]
    })
  end

  def loginUser
    userSession = updateDevice
    sendResponse('created',"User",{user: @user.as_json(:except=>[:password_digest,:confirm_otp,:created_at,:updated_at,:latitude,:longitude]).merge(accessToken:userSession.token,check_in:check_in)})
  end

end
