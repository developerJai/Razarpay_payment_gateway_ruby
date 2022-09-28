class Sessions::Signup < ApplicationService
  def initialize(params)
    @params = params
    # There will be two types of messages
    # Type 1. Normal Text message
    # Type 2.1. Document Message (doc_type: image, pdf, doc etc)
    # Type 2.2. Location Message (doc_type: location  {with: latitude, longitude})
    @user = User.new({
                  name: params[:name],
                  contact:params[:contact],
                  email: params[:email],
                  role: "user",
                  status:true,
                  password: params[:password]
      })
  end

  def call
    @user.save ? @user : nil
  end
end
