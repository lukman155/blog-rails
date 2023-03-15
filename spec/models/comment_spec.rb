require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.')
      first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
      expect(Comment.new(post: first_post, author: first_user, text: 'Hi Tom!')).to be_valid
    end
    it 'is not valid without a content' do
      expect(Comment.new).to_not be_valid
    end
  end
  context 'associations' do
    it 'belongs to author' do
      assc = described_class.reflect_on_association(:author)
      expect(assc.macro).to eq :belongs_to
    end
    it 'belongs to post' do
      assc = described_class.reflect_on_association(:post)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
