class FavoriteChefsController < ApplicationController

  def create

    if FavoriteChef.exists?(user_id: current_user.id, chef_id: params[:chef_id])
      redirect_to @chef
    else
      FavoriteChef.find_or_create_by(user_id: current_user.id, chef_id: params[:chef_id])
      @chef = Chef.find(params[:chef_id])
      redirect_to @chef
    end
  end
end
