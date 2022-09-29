
# Razarpay Payment Gateway Integration

This codebase is interacting with the Razorpay API. This projects explains how to use Rozerpay Payment Gatewat in our Rails Application.

## Required dependencies:

- Ruby is installed (v 3.1.0)
- Rails is installed (v 7.0.2)
- MySQL is installed
- Git is installed
- GitHub account is created
- Razorpay account created for business

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

For authentication:
- Devise here is the for gem documentation [link]()
- doorkeeper here is the for gem documentation [link]()
- doorkeeper-jwt here is the for gem documentation [link]()


## Implemented APIs Documentation

### 1. Signup User
User can signup by providing basic details
- Name
- Email 
- Password

### 2. Login User
- Email 
- Password
- client_id
- client_secret

```http
    POST http://localhost:3000/oauth/token
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `email` | `string` | **Required**.  |

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `password` | `password_digest` | **Required**. |

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `client_id` | `string` | **Required**. |

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `client_secret` | `string` | **Required**. |


### 3. Order create
```http
  POST http://localhost:3000/api/v1/order/create
 ```
- Amount 
- user id

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `amount` | `integer` | **Required**.  |

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `user_id` | `reference` | **Required**. |


### 4.verify_payment
```http
  POST http://localhost:3000/api/v1/order/verify
 ```
- gateway_order_id

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `gateway_order_id` | `string` | **Required**.  |


### Generate API Keys in Test and Live Modes, check error responses, parameters and other APIs.

```http
  base_url = GET https://api.razorpay.com/v1
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `YOUR_KEY_ID` | `string` | **Required**. YOUR_KEY_ID |

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `YOUR_SECRET` | `string` | **Required**. Your YOUR_SECRET key |

### Test and Live Mode API Keys

```http
  You can use Razorpay APIs in two modes, Test and Live. The API keys are different for each mode. Know about generating API Keys.
```

## Required dependencies to setup this project

- ruby v3.1.0
- rails v7.0.2

## Required data from Razorpay
We need to register our account on Razorpay as a business. We would need blow keys from our account:
- key_id
- key_secret
You can find your API keys at https://dashboard.razorpay.com/#/app/keys.

We will setup these keys in our Rozarpay configurations.
```http
Razorpay.setup('key_id', 'key_secret')
```
### Razorpay features
Razorpay provides various features to manage the complete payment process for an order.

Here is the list from their [documentation](https://github.com/razorpay/razorpay-ruby):
- Customer
- Token
- Order
- Payments
- Settlements
- Fund
- Refunds
- Invoice
- Plan
- Item
- Subscriptions
- Add-on
- Payment Links
- Smart Collect
- Transfer
- QR Code
- Emandate
- Cards
- Paper NACH
- UPI
- Register Emandate and Charge First Payment Together
- Register NACH and Charge First Payment Together
- Payment Verification
