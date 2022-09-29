class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # def authenticate(email, password)
   #   user = User.find_for_authentication(email: email)
   #   user.try(:valid_password?, password) ? user : nil
   # end
   
end
