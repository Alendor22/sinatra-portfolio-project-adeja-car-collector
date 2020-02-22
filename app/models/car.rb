class Car < ActiveRecord::Base

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :favorites
  has_many :fans, through: :favorites, source: :user
  has_many :followers, class_name: "User", foreign_key: :favorite_car_id

end