class FixParentColName < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :parent_comment, :parent_comment_id
  end
end
