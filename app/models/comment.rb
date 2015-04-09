class Comment < ActiveRecord::Base
  validates :author_id, :photo_id, :body, presence: true

  belongs_to :photo

  belongs_to(
    :author,
    :primary_key => :id,
    :foreign_key => :author_id,
    :class_name => "User" )
end
