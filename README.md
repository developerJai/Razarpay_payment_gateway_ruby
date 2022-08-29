
# Razarpay Payment Gateway using rails

This is the base ruby gem for interacting with the Razorpay API. This is primarily meant for users who wish to perform interactions with the Razorpay API programatically.

## Installation

Add this line to your application's Gemfile:

```bash
  gem 'razorpay'
```

And then execute:

```bash
  $ bundle
```

Or install it yourself as:
```bash
 $ gem install razorpay
```

    
## API Reference

#### Generate API Keys in Test and Live Modes, check error responses, parameters and other APIs.

```http
  GET https://api.razorpay.com/v1
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `YOUR_KEY_ID` | `string` | **Required**. YOUR_KEY_ID |

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `YOUR_SECRET` | `string` | **Required**. Your YOUR_SECRET key |

#### Test and Live Mode API Keys

```http
  You can use Razorpay APIs in two modes, Test and Live. The API keys are different for each mode. Know about generating API Keys.
```





## Requirements

# Ruby
ruby "3.1.0"

# Rails
gem "rails", "~> 7.0.2", ">= 7.0.2.3"


## Documentation

Remember to require 'razorpay' before anything else.

Next, you need to setup your key and secret using the following:


```http
Razorpay.setup('key_id', 'key_secret')
```

You can find your API keys at https://dashboard.razorpay.com/#/app/keys.
## Related

Customer

Token

Order

Payments

Settlements

Fund

Refunds

Invoice

Plan

Item

Subscriptions

Add-on

Payment Links

Smart Collect

Transfer

QR Code

Emandate

Cards

Paper NACH

UPI

Register Emandate and Charge First Payment Together

Register NACH and Charge First Payment Together

Payment Verification
## Usage/Examples

```javascript
razorpay_payment_id ,razorpay_payment_id and  razorpay_signature are fetched after success from frontend in payment through razarpay and received  in parameters so it will be used in to verify payments api .



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
```

