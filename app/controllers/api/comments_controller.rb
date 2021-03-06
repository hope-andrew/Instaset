class Api::CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.photo = Photo.find(params[:photo_id])
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
