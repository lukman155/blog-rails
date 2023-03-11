class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def query_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  def post_count=(count)
    self.postscounter = count
  end

  after_save :update_post_counts

  private

  def update_post_counts
    user = User.find(user_id)
    user.post_count = Post.where(user_id: user.id).count
    user.save
  end
end
