class Photo < ActiveRecord::Base
  validates :user_id, :img_url, :caption, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many(
    :likes,
    primary_key: :id,
    foreign_key: :liked_photo,
    class_name: "Like",
    inverse_of: :photo,
    dependent: :destroy
  )

  has_many :likers, through: :likes, source: :user

  default_scope { order(created_at: :desc) }

  def self.find_feed_pics(follow_ids, current_user_id)
    follow_ids << current_user_id
    Photo.where(user_id: follow_ids)
    # .order("created_at ASC")
  end
end
