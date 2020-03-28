class CreatePostUserLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_user_likes do |t|

      t.timestamps
    end
  end
end
