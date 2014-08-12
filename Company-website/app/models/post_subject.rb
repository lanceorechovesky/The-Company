class PostSubject < ActiveRecord::Base
  has_many :posts
  has_many :comments, as: :commentable
end
