class Users::CommentsController < ApplicationController

  def create
    @food = Food.find(params[:food_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to food_path(@food.id)
    else
      redirect_to food_path(@food.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :food_id)
  end
end
