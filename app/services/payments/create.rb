class Payments::Create < ApplicationService
  def initialize(user, amount, currency)
    @user = user
    @amount = amount
    @currency = currency
    @order = Order.new({
      user_id: @user.id,
      currency: @currency,
      amount: @amount
    })
    @amount = @amount.to_i * 100
    Razorpay.setup(ENV["RAZORPAY_KEY_ID"],ENV["RAZORPAY_KEY_SECRET"])
    Razorpay.headers = {"Content-type" => "application/json"}
    para_attr = {"amount": @amount,"currency": "INR","receipt": "#{@order.id}"}
    order = Razorpay::Order.create(para_attr.to_json)
    @order.update(gateway_order_id: order.id)
    @link = Payments::LinkCreate.call(@user, @order)
  end

  def call
    @order.save ? @order : nil
  end
end
