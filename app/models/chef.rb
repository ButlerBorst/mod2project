class Chef < ApplicationRecord
  belongs_to :restaurant
  has_many :dishes
  has_many :favorite_chefs
  has_many :chef_comments

  has_many :users, through: :favorite_chefs
  has_many :users, through: :chef_comments

end
