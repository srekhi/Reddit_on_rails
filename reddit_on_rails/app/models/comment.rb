# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :string
#  author_id         :integer
#  post_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_comment_id :integer
#

class Comment < ApplicationRecord

  belongs_to :author, # => rails 5 auto checks for validation here.
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :post,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Post,
    optional: true


  has_many :child_comments, # => self joins on child comment's parent comment id matches this comment.
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: :Comment

end
