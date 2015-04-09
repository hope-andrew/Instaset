class Photo < ActiveRecord::Base
  validates :user_id, :img_url, :caption, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy
end
