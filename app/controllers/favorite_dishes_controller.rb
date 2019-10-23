class FavoriteDishesController < ApplicationController

  def create

    if FavoriteDish.exists?(user_id: current_user.id, dish_id: params[:dish_id])
      redirect_to @dish
    else
      FavoriteDish.find_or_create_by(user_id: current_user.id, dish_id: params[:dish_id])
      @dish = Dish.find(params[:dish_id])
      redirect_to @dish
    end
  end
end
