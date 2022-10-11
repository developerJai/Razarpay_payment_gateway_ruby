class Payments::LinkCreate < ApplicationService
  def initialize(user, order)
    @user = user
    @order = order
    Razorpay.setup(ENV["RAZORPAY_KEY_ID"],ENV["RAZORPAY_KEY_SECRET"])
    Razorpay.headers = {"Content-type" => "application/json"}

    para_attr = {
      "amount": @order.amount,
      "currency": "INR",
      "accept_partial": false,
      "first_min_partial_amount": 100,
      "description": "Restaurant Order",
      "customer": {
        "name": @user.email.split('@').first,
        "email": @user.email,
        "contact": ""
      },
      "notify": {
        "sms": true,
        "email": true
      },
      "reminder_enable": true,
      "callback_url": "https://example-callback-url.com/",
      "callback_method": "get"
    }
    # Set our values for callback instead of https://example-callback-url.com/
    payment_link = Razorpay::PaymentLink.create(para_attr.to_json)
    @order.update(pay_link_id: payment_link.id,payment_link:payment_link.short_url)
  end

  def call
    @order ? @order : nil
  end
end
