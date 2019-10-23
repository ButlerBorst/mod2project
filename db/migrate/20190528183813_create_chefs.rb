class CreateChefs < ActiveRecord::Migration[5.2]
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :image
      t.string :bio
      t.integer :experience
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
