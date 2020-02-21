class User < ActiveRecord::Base

  has_many :cars, foreign_key: :owner_id
  has_many :favorites
  belongs_to :all_time_favorite, required: false, class_name: "Car", foreign_key: :favorite_car_id
  has_many :favorite_cars, through: :favorites, source: :car
  has_secure_password
  validates :username, presence: true, uniqueness: true

end