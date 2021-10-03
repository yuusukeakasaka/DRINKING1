class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

      t.timestamps

       t.integer :user_id
       t.integer :post_id
       t.datetime :created_at
       t.datetime :updated_at

    end
  end
end
