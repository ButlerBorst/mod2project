class ChangeChefsExperienceType < ActiveRecord::Migration[5.2]
  def change
    change_column :chefs, :experience, :integer
  end
end
