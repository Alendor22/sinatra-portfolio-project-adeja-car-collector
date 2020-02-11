class User < ActiveRecord::Base

  has_many :user_cars
  has_many :cars, through: :user_cars
  validates :username, presence: true

end
