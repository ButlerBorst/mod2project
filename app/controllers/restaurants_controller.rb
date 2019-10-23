class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant_comment = RestaurantComment.new
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.valid?
      @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def delete

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :image, :type, :location, :popular_dish, :user_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
