class ChefCommentsController < ApplicationController

  def create
    ChefComment.create(user_id: current_user.id, chef_id: params[:chef_comment][:chef_id], comment: params[:chef_comment][:comment])
    @chef = Chef.find(ChefComment.last.chef.id)
    redirect_to @chef
  end
end
