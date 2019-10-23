class RemoveTableFromFavs < ActiveRecord::Migration[5.2]
  def change
    rename_table :table_favorite_chefs, :favorite_chefs
    rename_table :table_favorite_restaurants, :favorite_restaurants
    rename_table :table_favorite_dishes, :favorite_dishes
  end
end
