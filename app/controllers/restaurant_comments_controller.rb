class RestaurantCommentsController < ApplicationController

  def create
    RestaurantComment.create(user_id: current_user.id, restaurant_id: params[:restaurant_comment][:restaurant_id], comment: params[:restaurant_comment][:comment])
    @restaurant = Restaurant.find(RestaurantComment.last.restaurant.id)
    redirect_to @restaurant
  end
end
