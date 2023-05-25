rubocop:disable
class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  validates :name, presence: true
  validates :postscounter, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
rubocop:enable
