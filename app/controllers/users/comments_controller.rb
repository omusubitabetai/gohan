class Users::CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def edit
  end

  private

  def food_params
    params.require(:comment).permit(:text)
  end
end
