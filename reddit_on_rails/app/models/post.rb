# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true
  validates :subs, presence: true # => post must belong to at least one subforum

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :postsubs, # => when we call postsubs_ids = something, they're associated with the calling post object.
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Postsub,
    inverse_of: :post

  has_many :subs,
    through: :postsubs,
    source: :sub

  has_many :comments, # => when we call postsubs_ids = something, they're associated with the calling post object.
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Comment

end
