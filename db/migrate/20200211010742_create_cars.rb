class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :location
      t.integer :price
      t.boolean :status

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
