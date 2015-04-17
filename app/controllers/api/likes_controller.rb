class Api::LikesController < ApplicationController
  def create
    @like = current_user.likes.new(liked_photo: params[:photo_id])

    # @like.photo = Photo.find(params[:photo_id])

    if @like.save
      render json: @like
    else
      render json: @like.errors.full_messages, status: 422
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    render json: ["like destroyed"]
  end
end
