class Api::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    if @user
      render :show
    else
      render json: "No user found", status: 403
    end
  end

end
