class Post < ActiveRecord::Base
  belongs_to :post_subject
  has_many :comments, as: :commentable
end
