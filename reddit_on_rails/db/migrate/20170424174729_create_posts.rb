class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :post_id, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
