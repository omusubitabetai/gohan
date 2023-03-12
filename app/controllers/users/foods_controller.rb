class Users::FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def index
    @foods = Food.all
  end

  def show
    @user = User.find(params[:id])
    @food = Food.find(params[:id])
    @comments = @food.comments
    @comment = current_user.comments.new
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    food = Food.find(params[:id])
    food.update(food_params)
    redirect_to food_path(food.id)
  end

  private

  def food_params
    params.require(:food).permit(:title, :text, :agreement).merge(params.require(:food).permit(images: []))
  end

end
