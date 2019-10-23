class DishCommentsController < ApplicationController

  def create
    DishComment.create(user_id: current_user.id, dish_id: params[:dish_comment][:dish_id], comment: params[:dish_comment][:comment])
    @dish = Dish.find(DishComment.last.dish.id)
    redirect_to @dish
  end
end
