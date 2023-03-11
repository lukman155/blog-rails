class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def query_posts
    Post.where(user_id: id).order(created_at: :desc).limit(3)
  end
end
