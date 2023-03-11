class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comment_counts

  private

  def update_comment_counts
    post = Post.find(post_id)
    post.comment_count = Comment.where(post_id: post.id).count
    post.save
  end
end
