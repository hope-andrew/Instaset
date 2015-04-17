class Like < ActiveRecord::Base
  validates :liker, :liked_photo, presence: true
  validates :liker, uniqueness: { scope: :liked_photo,
    message: "can only like photo once per user" }

  belongs_to(
    :photo,
    primary_key: :id,
    foreign_key: :liked_photo,
    inverse_of: :likes,
    class_name: "Photo"
  )

  belongs_to(
    :user,
    primary_key: :id,
    foreign_key: :liker,
    inverse_of: :likes,
    class_name: "User"
  )
end
