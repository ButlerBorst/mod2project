class User < ApplicationRecord
  has_many :favorite_chefs
  has_many :favorite_restaurants
  has_many :favorite_dishes

  has_many :chef_comments
  has_many :restaurant_comments
  has_many :dish_comments


  has_many :chefs, through: :favorite_chefs
  has_many :restaurants, through: :favorite_restaurants
  has_many :dishes, through: :favorite_dishes

  has_many :chefs, through: :chef_comments
  has_many :restaurants, through: :restaurant_comments
  has_many :dishes, through: :dish_comments

end
