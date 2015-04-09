class Api::PhotosController < ApplicationController
  def create
    @photo = current_user.photos.new(photo_params)

    if @photo.save
      render json: @photo
    else
      render json: @photo.errors.full_messages, status: :unprocessable_entity
    end
  end

  def new

  end

  def index
    @photos = current_user.photos
    render json: @photos
  end

  def show
    @photo = Photo.find(params[:id])

    if @photo
      render :show
    else
      render json: ["did not find a photo with that id"], status: 403
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:img_url, :caption)
  end
end
