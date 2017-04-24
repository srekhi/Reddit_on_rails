class CreatePostsubs < ActiveRecord::Migration[5.0]
  def change
    create_table :postsubs do |t|
      t.integer :sub_id, null: false
      t.integer :post_id, null: false
      t.timestamps
    end
  end
end
