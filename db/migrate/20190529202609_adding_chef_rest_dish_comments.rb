class AddingChefRestDishComments < ActiveRecord::Migration[5.2]
  def change
    create_table :chef_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :chef_id

      t.timestamps
    end

    create_table :restaurant_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end

    create_table :dish_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :dish_id

      t.timestamps
    end
  end
end
