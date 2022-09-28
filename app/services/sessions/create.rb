class Sessions::Create < ApplicationService
  def initialize(user, params)
    @user = user
    @params = params
    # There will be two types of messages
    # Type 1. Normal Text message
    # Type 2.1. Document Message (doc_type: image, pdf, doc etc)
    # Type 2.2. Location Message (doc_type: location  {with: latitude, longitude})
    @session = @user.sessions.new({
        device_id: request.headers["device_token"],
        device_type: request.headers["device_type"],
        device_model: request.headers["device_model"],
        timeZone: request.headers["time_zone"]
      })
  end

  def call
    @session.save ? @session : nil
  end
end
