class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_like_counts

  private

  def update_like_counts
    post = Post.find(post_id)
    post.like_count = Like.where(post_id: post.id).count
    post.save
  end
end
