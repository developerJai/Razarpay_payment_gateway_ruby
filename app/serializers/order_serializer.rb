class OrderSerializer < ActiveModel::Serializer
  attributes :id,:amount,:gateway_order_id,:Paylink_id,:razorpay_order_id
end
