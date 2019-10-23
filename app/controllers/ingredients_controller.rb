class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.valid?
      @ingredient.save
      redirect_to @ingredient
    else
      render :new
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient
    else
      render :edit
    end
  end

  def delete

  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:ingredients, :name, :recipe_id)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
