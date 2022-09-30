class Payments::LinkCreate < ApplicationService
  def initialize(user, order)
    @user = user
    @order = order
    # There will be two types of messages
    # Type 1. Normal Text message
    # Type 2.1. Document Message (doc_type: image, pdf, doc etc)
    # Type 2.2. Location Message (doc_type: location  {with: latitude, longitude})

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

      payment_link = Razorpay::PaymentLink.create(para_attr.to_json)
          
      @order.update(Paylink_id: payment_link.id,payment_link:payment_link.short_url)
  end

  def call
    @order ? @order : nil
  end
end
