class AddParentCommentIdToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :parent_comment, :integer
  end
end
