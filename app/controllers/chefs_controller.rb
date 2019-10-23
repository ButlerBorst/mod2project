class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update]

  def index
    @chefs = Chef.all
  end

  def new
    @chef = Chef.new
  end

  def show
    @restaurant = @chef.restaurant
    @chef_comment = ChefComment.new
  end

  def create
    @chef = Chef.new(chef_params)

    if @chef.valid?
      @chef.save
      redirect_to @chef
    else
      render :new
    end
  end

  def update
    if @chef.update(chef_params)
      redirect_to @chef
    else
      render :edit
    end
  end

  def delete

  end

  private

  def chef_params
    params.require(:chef).permit(:name, :image, :bio, :experience, :restaurant_id, :user_id)
  end

  def set_chef
    @chef = Chef.find(params[:id])
  end
end
