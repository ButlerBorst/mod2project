class Restaurant < ApplicationRecord
  has_many :chefs
  has_many :favorite_restaurants
  has_many :restaurant_comments

  has_many :users, through: :favorite_restaurants
  has_many :users, through: :restaurant_comments
end

# User.last.restaurants << Restaurant.last
