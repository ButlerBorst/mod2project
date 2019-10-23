class FavoriteRestaurantsController < ApplicationController

  def create

    if FavoriteRestaurant.exists?(user_id: current_user.id, restaurant_id: params[:restaurant_id])
      redirect_to @restaurant
    else
      FavoriteRestaurant.find_or_create_by(user_id: current_user.id, restaurant_id: params[:restaurant_id])
      @restaurant = Restaurant.find(params[:restaurant_id])
      redirect_to @restaurant
    end
  end
end
