class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image
      t.string :type
      t.string :location
      t.string :popular_dish
      t.integer :user_id

      t.timestamps
    end
  end
end
