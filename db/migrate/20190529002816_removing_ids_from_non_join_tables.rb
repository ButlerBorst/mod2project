class RemovingIdsFromNonJoinTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :chefs, :user_id
    remove_column :dishes, :user_id
    remove_column :restaurants, :user_id
  end
end
