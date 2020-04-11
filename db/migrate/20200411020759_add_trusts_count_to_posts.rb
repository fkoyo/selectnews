class AddTrustsCountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :trusts_count, :integer
  end
end
