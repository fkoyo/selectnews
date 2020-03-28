class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :like_name, null: false, unique: true
      t.timestamps
    end
  end
end
