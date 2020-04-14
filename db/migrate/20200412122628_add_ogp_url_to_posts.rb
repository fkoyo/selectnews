class AddOgpUrlToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :ogp_url, :text
  end
end
