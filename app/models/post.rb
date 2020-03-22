class Post < ApplicationRecord
  belongs_to :user

  validates :news_url, presence: true
end
