class CreateTableFavoriteChefs < ActiveRecord::Migration[5.2]
  def change
    create_table :table_favorite_chefs do |t|
      t.integer :user_id
      t.integer :chef_id
    end
  end
end
