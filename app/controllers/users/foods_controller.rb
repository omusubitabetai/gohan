class Users::FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @food = Food.new
  end

  def create
    #render 'new' and return if params[:food][:unopen] == '1' || params[:food][:relish] == '1'
     # チェックボックスにチェックない場合エラ-にしたい
    # render 'new' if params[:food][:unopen] == '0' || params[:food][:~~~] == '0'
    # saveしないでrednerさせる条件に↑のparamsの値のチェックが入る
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to foods_path
    else
      render 'new'
      #render 'new' if params[:food][:unopen] == '0' || params[:food][:relish] == '0'
    end
  end


  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
  end

  private

  def food_params
    params.require(:food).permit(:title, :text, :agreement).merge(params.require(:food).permit(images: []))
  end

end
