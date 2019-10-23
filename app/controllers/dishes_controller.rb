class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update]

  def index
    @dishes = Dish.all
  end

  def show
    @chef = @dish.chef
    @dish_comment = DishComment.new
  end

  def new
    @dish = Dish.new
    @dish.ingredients.build
    @dish.ingredients.build
    @dish.ingredients.build
    @dish.ingredients.build
    @dish.ingredients.build
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.valid?
      @dish.save
      redirect_to @dish
    else
      render :new
    end
  end

  def update
    if @dish.update(dish_params)
      redirect_to @dish
    else
      render :edit
    end
  end

  def delete

  end

  private

  def dish_params
    params.require(:dish).permit(:name, :image, :chef_id, :user_id, ingredients_attributes: %i[id name])
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end
end
