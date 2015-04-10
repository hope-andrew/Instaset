json.extract! @photo, :user_id, :id, :img_url, :caption

json.comments @photo.comments.includes(:author) do |comment|
  json.extract! comment, :id, :body, :author_id, :photo_id
  json.author comment.author.username
end

json.username @photo.user.username

json.likes @photo.likers do |liker|
  json.liker liker.username
end
