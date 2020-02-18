class User < ActiveRecord::Base

  has_many :user_cars
  has_many :cars, through: :user_cars
  has_secure_password
  validates :username, presence: true, uniqueness: true

end
