class Like < ActiveRecord::Base
  validates :liker, :liked_photo, presence: true

  belongs_to(
    :photo,
    primary_key: :id,
    foreign_key: :liked_photo,
    class_name: "Photo"
  )

  belongs_to(
    :user,
    primary_key: :id,
    foreign_key: :liker,
    class_name: "User"
  )
end
