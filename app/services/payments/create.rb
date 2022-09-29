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
      Razorpay.setup(ENV["RAZORPAY_KEY_ID"],ENV["RAZORPAY_KEY_SECRET"])
      Razorpay.headers = {"Content-type" => "application/json"}

      para_attr = {"amount": amount,"currency": "INR","receipt": "#{@order.id}"}

      order = Razorpay::Order.create(para_attr.to_json)
          
      @order.update(gateway_order_id: order.id)

      @link = Payments::LinkCreate.call(@user, @order)

  end

  def call
    @order.save ? @order : nil
  end
end
