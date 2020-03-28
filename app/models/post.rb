class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :post_user_likes
  has_many :likes, through: :post_user_likes
  validates :news_url, presence: true
end
