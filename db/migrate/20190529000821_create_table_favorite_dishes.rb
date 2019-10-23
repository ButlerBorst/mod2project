class CreateTableFavoriteDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :table_favorite_dishes do |t|
      t.integer :user_id
      t.integer :dish_id
    end
  end
end
