class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :liker, null: false, index: true
      t.integer :liked_photo, null: false, index: true

      t.timestamps null: false
    end
  end
end
