# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version => 3.1.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

#========Project creation guide ========================================================

* Created User model for user details
 
* Order model for Order record and payments details

* payments controller for order api and verify api in controller/api/v1/payments

* add require "razorpay" in controller

* install gem 'razorpay'

* razorpay_payment_id ,razorpay_payment_id and  razorpay_signature are fetched after success from frontend in payment through razarpay and received  in parameters so it will be used in to verify payments api .



* api url ==> http://localhost:3000/api/v1/order/create
	body parameter  {
	    "user_id":1,
	    "amount":100
	}


* api url ==> http://localhost:3000/api/v1/order/verify
	body parameter {
	    "gatewayOrderId":"xyz",

	    these will be recieved by frontend only with success
		   "razorpay_payment_id":"xyz",
		   "razorpay_signature":"xyz",
		   "razorpay_order_id":"xyz"
	}

