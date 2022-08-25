class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :razorpay_order_id
      t.string :razorpay_payment_id
      t.string :razorpay_signature
      t.string :Paylink_id
      t.string :payment_link
      t.string :gateway_order_id
      t.float :amount
      t.references :user, null: true

      t.timestamps
    end
  end
end
