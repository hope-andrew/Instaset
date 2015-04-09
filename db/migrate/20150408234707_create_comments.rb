class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false, index: true
      t.integer :photo_id, null: false, index: true
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
