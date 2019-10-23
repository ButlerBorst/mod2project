class FavoriteChef < ApplicationRecord
  belongs_to :chef
  belongs_to :user
end
