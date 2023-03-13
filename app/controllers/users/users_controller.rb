class Users::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def quit
  end

  def out
    @user = current_user
    @user.update(is_deleted:true)
    reset_session
    redirect_to root_path
  end

  def requests
    @user = User.find(params[:id])
    requests = Request.where(user_id: @user.id).pluck(:food_id)
    @request_foods = Food.find(requests)
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:food_id)
    @favorite_foods = Food.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :image )
  end
end
