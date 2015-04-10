json.array! @pics do |pic|
  json.extract! pic, :id, :img_url, :user_id, :caption

  json.comments pic.comments do |comment|
    json.extract! comment, :author_id, :photo_id, :body
    json.author User.find(comment.author_id).username
  end

  json.user pic.user :username
end
