class CreateFavorites < ActiveRecord::Migration
  def change 
    create_table :favorites do |t|
      t.integer :car_id
      t.integer :user_id
      
      t.timestamps :created_at, null: false
      t.timestamps :updated_at, null: false
    end
  end
end
