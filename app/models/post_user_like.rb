class PostUserLike < ApplicationRecord
  belongs_to :like
  belongs_to :post
  belongs_to :user
end
