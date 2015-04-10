class Photo < ActiveRecord::Base
  validates :user_id, :img_url, :caption, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy

  def self.find_feed_pics(follow_ids)
    Photo.where(user_id: follow_ids) 
  end
end
