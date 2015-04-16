json.extract! @user, :id, :username

json.photos @user.photos do |photo|
  json.extract! photo, :img_url, :caption, :id
  json.likes photo.likes.count
  json.comments photo.comments.count
end

json.follows @user.following do |follow|
  json.extract! follow, :id, :username
end
