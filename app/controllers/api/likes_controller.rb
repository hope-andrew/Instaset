class Api::LikesController < ApplicationController
  def create
    @like = current_user.likes.new()
    @like.photo = Photo.find(params[:photo_id])

    if @like.save
      render json: @like
    else
      render json: ["could not create like"], status: 422
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    render json: ["like destroyed"]
  end
end
