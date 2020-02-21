class AddFavoriteCarIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :favorite_car_id, :integer
  end
end
