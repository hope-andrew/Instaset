json.pics do
  json.array! @pics do |pic|
    json.extract! pic, :id, :img_url, :user_id, :caption, :created_at

    json.comments pic.comments do |comment|
      json.extract! comment, :author_id, :photo_id, :body
      json.author User.find(comment.author_id).username
    end

    json.extract! pic.user, :username

    json.profile_pic pic.user.photos.first.img_url


    json.likes pic.likers do |liker|
      json.liker liker.username
    end
  end
end

json.page @page
json.total_pages @pics.total_pages
