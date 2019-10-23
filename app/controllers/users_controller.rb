class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      @user.save
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def show
    comments = []
    current_user.chef_comments.each do |comment|
      comments << comment
    end
    current_user.restaurant_comments.each do |comment|
      comments << comment
    end
    current_user.dish_comments.each do |comment|
      comments << comment
    end
    @user_comments = comments.sort_by{ |comment| comment.updated_at }


    @dish_favorites = []
    @chef_favorites = []
    @restaurant_favorites = []

    current_user.favorite_dishes.each do |favorite|
      @dish_favorites << Dish.find(favorite.dish_id)
    end
    current_user.favorite_chefs.each do |favorite|
      @chef_favorites << Chef.find(favorite.chef_id)
    end
    current_user.favorite_restaurants.each do |favorite|
      @restaurant_favorites << Restaurant.find(favorite.restaurant_id)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :image)
  end

  def set_user
    @user = current_user
  end
end
