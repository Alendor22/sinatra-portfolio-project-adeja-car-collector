class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :location
      t.integer :price
      t.boolean :status
      t.integer :owner_id
      t.timestamps :created_at, null: false
      t.timestamps :updated_at, null: false
    end
  end
end
