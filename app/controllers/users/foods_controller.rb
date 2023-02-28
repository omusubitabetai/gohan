class Users::FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def create
    food = Food.new(food_params)
    food.save
    redirect_to foods_path
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def food_params
    params.require(:food).permit(:title, :text)
  end

end
