class Payments::Verify < ApplicationService
  def initialize(order)
    # Verify payment signature after payment successful/failed on server side
    @order = order
    Razorpay.setup(ENV["RAZORPAY_KEY_ID"],ENV["RAZORPAY_KEY_SECRET"])
    Razorpay.headers = {"Content-type" => "application/json"}
    payment_response = {"razorpay_order_id": @order.gateway_order_id,"razorpay_payment_id": @order.pay_link_id,"razorpay_signature": @order.razorpay_signature}
    @response = Razorpay::Utility.verify_payment_signature(payment_response)
    @order.update(status:@response)
    @response = @order.status
  end

  def call
    @order ? @order : nil
  end
end
