class Post < ActiveRecord::Base
  belongs_to :post_subject
  has_many :comments, as: :commentable

  has_many :post_tags
  has_many :tags, through: :post_tags
end
