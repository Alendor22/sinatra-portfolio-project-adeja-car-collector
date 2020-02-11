class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :location
      t.string :favorites
      t.string :password_digest

      t.timestamps :created_at, null: false
      t.timestamps :updated_at, null: false
    end
  end
end
