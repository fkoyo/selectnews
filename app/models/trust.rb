class Trust < ApplicationRecord
  belongs_to :post, counter_cache: :trusts_count
  belongs_to :user
end
