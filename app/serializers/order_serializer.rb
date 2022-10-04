class OrderSerializer < ActiveModel::Serializer
  attributes :id,:amount,:gateway_order_id,:pay_link_id,:razorpay_order_id,:payment_link
end
