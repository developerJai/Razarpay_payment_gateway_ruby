class Session < ApplicationRecord
	belongs_to :user
	before_create :generateToken
	
	def generateToken
  		self.token = loop do
              token = SecureRandom.hex(10)
              break token unless Session.exists?(token: token)
        end
  	end
end
