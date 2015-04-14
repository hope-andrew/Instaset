json.array! @pics do |pic|
  json.extract! pic, :id, :img_url, :user_id, :caption, :created_at

  json.comments pic.comments do |comment|
    json.extract! comment, :author_id, :photo_id, :body
    json.author User.find(comment.author_id).username
  end

  json.extract! pic.user, :username

  json.likes pic.likers do |liker|
    json.liker liker.username
  end
end
