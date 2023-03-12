class Users::RequestsController < ApplicationController

  def create
    @food_request = Request.new(user_id: current_user.id, food_id: params[:food_id])
    @food_request.status = 0
    @food_request.save
    redirect_to food_requests_thanks_path(params[:food_id], @food_request.id)
  end

  def destroy
    @food_request = Request.find_by(user_id: current_user.id, food_id: params[:food_id])
    @food_request.destroy
    redirect_to food_path(params[:food_id])
  end

end
