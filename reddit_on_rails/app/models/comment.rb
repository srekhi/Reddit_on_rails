# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  content        :string
#  author_id      :integer
#  post_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  parent_comment :integer
#

class Comment < ApplicationRecord

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :post,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Post

  has_many :child_comments,
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: :Comment

end
