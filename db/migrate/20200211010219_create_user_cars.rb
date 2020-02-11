class CreateUserCars < ActiveRecord::Migration
  def change
    create_table :user_cars do |t|
      t.integer :user_id
      t.integer :car_id

      t.timestamps :created_at, null: false
      t.timestamps :updated_at, null: false
    end
  end
end
