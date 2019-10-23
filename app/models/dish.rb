class Dish < ApplicationRecord
  belongs_to :chef
  has_many :favorite_dishes
  has_many :recipes
  has_many :dish_comments
  has_many :users, through: :favorite_dishes
  has_many :ingredients, through: :recipes
  has_many :users, through: :dish_comments
  accepts_nested_attributes_for :ingredients


end
