class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.timestamps

      t.integer :user_id
      t.text :text
      t.string :title
      t.string :image_id
      t.datetime :created_at
      t.datetime :updated_at


    end
  end
end
