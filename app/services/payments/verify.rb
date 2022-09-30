class Payments::Verify < ApplicationService
  def initialize(order)
    @order = order
    # There will be two types of messages
    # Type 1. Normal Text message
    # Type 2.1. Document Message (doc_type: image, pdf, doc etc)
    # Type 2.2. Location Message (doc_type: location  {with: latitude, longitude})
        Razorpay.setup(ENV["RAZORPAY_KEY_ID"],ENV["RAZORPAY_KEY_SECRET"])
        Razorpay.headers = {"Content-type" => "application/json"}
        payment_response = {"razorpay_order_id": params[:razorpay_order_id],"razorpay_payment_id": params[:razorpay_payment_id],"razorpay_signature": params[:razorpay_signature]}
      @response = Razorpay::Utility.verify_payment_signature(payment_response)
      @order.update(status:@response)
      @response = @order.status
  end

  def call
    @order ? @order : nil
  end
end
