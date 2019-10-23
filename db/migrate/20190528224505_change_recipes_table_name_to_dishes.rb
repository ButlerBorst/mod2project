class ChangeRecipesTableNameToDishes < ActiveRecord::Migration[5.2]
  def change
    rename_table :recipes, :dishes
  end
end
