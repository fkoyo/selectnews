class CreatePostUserLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_user_likes do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.references :like, foreign_key: true
      t.timestamps
    end
  end
end
