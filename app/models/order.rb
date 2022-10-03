class Order < ApplicationRecord
  belongs_to :user
  enum currency: { INR: 'INR', USD: 'USD' ,SAR: 'SAR'}
end
