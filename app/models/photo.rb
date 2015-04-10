class Photo < ActiveRecord::Base
  validates :user_id, :img_url, :caption, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many(
    :likes,
    primary_key: :id,
    foreign_key: :liked_photo,
    class_name: "Like",
    dependent: :destroy
  )

  has_many :likers, through: :likes, source: :user

  def self.find_feed_pics(follow_ids)
    Photo.where(user_id: follow_ids)
  end
end
