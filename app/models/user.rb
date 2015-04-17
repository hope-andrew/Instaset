class User < ActiveRecord::Base

  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  attr_reader :password

  has_many :photos

  has_many(
    :follows,
    primary_key: :id,
    foreign_key: :follower_id,
    class_name: "Follow",
    dependent: :destroy
  )

  has_many(
    :comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: "Comment",
    dependent: :destroy
  )

  has_many(
    :likes,
    primary_key: :id,
    foreign_key: :liker,
    class_name: "Like",
    inverse_of: :user,
    dependent: :destroy
  )

  has_many :liked_photos, through: :likes, source: :photo

  def password=(password)
    @password = password

    self.password_digest = BCrypt::Password.create(password)

  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def follow_ids
    self.follows.map{|follow| follow.follow_id }
  end

  def following
    self.follow_ids.map{|id| User.find(id)}
  end

  def followers
    Follow.where(follow_id: self.id)
  end

  def total_user_likes
    photo_ids_arr = self.photos.map{|photo| photo.id }
    Like.where(liked_photo: photo_ids)
  end

  def self.find_by_credentials(username, password)
    @user = User.find_by_username(username)

    if @user.nil?
      return nil
    else
      return ( @user.is_password?(password) ? @user : nil )
    end
  end
end
