class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :news_url, presence: true
end
