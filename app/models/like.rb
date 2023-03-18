class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_like_counts

  private

  def update_like_counts
    post = Post.find(post_id)
    post.likescounter = Like.where(post_id: post.id).count
    post.save
  end
end
