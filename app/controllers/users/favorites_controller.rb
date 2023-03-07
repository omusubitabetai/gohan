class Users::FavoritesController < ApplicationController
  def create
  @food_favorite = Favorite.new(user_id: current_user.id, food_id: params[:food_id])
  @food_favorite.save
  redirect_to food_path(params[:food_id])
  end

  def destroy
  @food_favorite = Favorite.find_by(user_id: current_user.id, food_id: params[:food_id])
  @food_favorite.destroy
  redirect_to food_path(params[:food_id])
  end

  def index
  end
end
