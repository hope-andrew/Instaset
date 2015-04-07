class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:error] = [@user.errors.full_messages]
      render :new
    end
  end

  def show
    @user = current_user

    if @user
      render :show
    else
      render json: "No user found"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
