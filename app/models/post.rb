class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :post_user_likes
  has_many :likes, through: :post_user_likes
  validates :news_url, presence: true
  has_many :trusts, dependent: :destroy

  def trusted(user)
    trust.create(user_id: user.id)
  end

  def untrusted(user)
    trust.find_by(user_id: user.id).destroy
  end
end
