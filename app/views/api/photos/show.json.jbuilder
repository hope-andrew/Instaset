json.extract! @photo, :user_id, :id, :img_url, :caption

json.idOfLikeByCurrentUser current_user.likes.find_by(photo: @photo) #||
#   current_user.likes.where(photo: @photo).id

json.comments @photo.comments.includes(:author) do |comment|
  json.extract! comment, :id, :body, :author_id, :photo_id
  json.author comment.author.username
end

json.username @photo.user.username

json.profile_pic @photo.user.photos.first.img_url

# json.likes @photo.likers do |liker|
#   json.liker liker.username
# end

json.likes @photo.likes do |like|
  json.extract! like, :id, :liker, :liked_photo
end
