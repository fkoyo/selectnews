class Like < ApplicationRecord
  has_many :post_user_likes
  has_many :posts, through: :post_user_likes
  has_many :users, through: :post_user_likes
  validates :like_name, presence: true, uniqueness: true
end
