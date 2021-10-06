class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|

      t.integer :user_id
      t.text :recruitment_post
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
