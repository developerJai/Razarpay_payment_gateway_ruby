
# Razarpay Payment Gateway using rails

This codebase is interacting with the Razorpay API. This projects explains how to use Rozerpay Payment Gatewat in our Rails Application.

## Required dependencies:

- Ruby is installed (v 3.0.1)
- Rails is installed (v 6.1.4)
- MySQL is installed
- Git is installed
- GitHub account is created
- 
## Major steps are followed to create and setup this project:
- Cloned/created a new rails project
- Database configuration setup (using MySQL)
- Initialize a local repository using git
- .gitignore file created to add configuration.yml
- configuration.yml file created to initialize environment variables
- Created a new remote repository using GitHub
- Implemented required APIs for order and process a payment
- Changed README.md and documentation added
- Code Commited and Pushed to GitHub repository

## Create configuration.yml to setup required environment variables
* Go to the config directory
* Create a new file with name *configuration.yml*

## Required variables to define in configuration.yml
````
RAZORPAY_KEY_ID:   enter_key_id_here_xxxxxxxxxxxxxxxxxxxxxx
RAZORPAY_KEY_SECRET: enter_key_secret_here_xxxxxxxxxxxxxxxxxxxxxx
````

## Used Gem
Payment Gateway
- ` gem 'razorpay'` here is the [link](https://github.com/razorpay/razorpay-ruby)
Authentication:
- Devise 

## Implemented APIs Documentation
### 1. Signup User
User can signup by providing basic details
- Name
- Email 
- Password

### 2. Login User
- Email 
- Password
### 3. Order create
```http
  POST http://localhost:3000/api/v1/order/create
 ```
- Amount 
- user id

### 4.verify_payment
```http
  POST http://localhost:3000/api/v1/order/verify
 ```
- gateway_order_id

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

