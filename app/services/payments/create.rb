class Payments::Create < ApplicationService
  def initialize(user, params)
    @user = user
    @params = params
    # There will be two types of messages
    # Type 1. Normal Text message
    # Type 2.1. Document Message (doc_type: image, pdf, doc etc)
    # Type 2.2. Location Message (doc_type: location  {with: latitude, longitude})
    @order = Order.new({
        user_id: @user.id,
        amount: params[:amount]
      })
  end

  def call
    @order.save ? @order : nil
  end
end
