json.extract! @photo, :user_id, :id, :img_url, :caption

json.comments @photo.comments do |comment|
  json.extract! comment, :id, :body, :author_id, :photo_id
end
