class UserCar < ActiveRecord::Base

  belongs_to :user
  belongs_to :cars

end
