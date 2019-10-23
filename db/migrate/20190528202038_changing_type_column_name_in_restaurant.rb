class ChangingTypeColumnNameInRestaurant < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :type, :kind
  end
end
