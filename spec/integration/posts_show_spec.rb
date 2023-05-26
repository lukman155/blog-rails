require 'rails_helper'

RSpec.describe 'Posts show page', type: :system do
  describe 'check the content of the show page' do
    before(:each) do
      @user_one = User.create(name: 'Lukman',
                              photo: 'https://www.anisearch.de/images/character/cover/full/0/817.webp', bio: 'software engineer', postscounter: 0)
      @post_one = Post.create(user: @user_one, title: 'Hello', text: 'this is my first post', commentscounter: 1,
                              likescounter: 2)
      @post_two = Post.create(user: @user_one, title: 'jobs', text: 'I am gonna get a job in may', commentscounter: 1,
                              likescounter: 2)
      @comment = Comment.create(post: @post_one, user: @user_one, text: 'hi nice to meet you')
    end

    it 'User should see the post title' do
      visit user_post_path(@user_one, @post_one)
      sleep(1)
      expect(page).to have_content('Hello')
    end

    it 'User should see who wrote the post' do
      visit user_post_path(@user_one, @post_one)
      sleep(1)
      expect(page).to have_content('Lukman')
    end

    it 'User should see the post body' do
      visit user_post_path(@user_one, @post_one)
      sleep(1)
      expect(page).to have_content('this is my first post')
    end

    it 'User should see the number of comments it has' do
      visit user_post_path(@user_one, @post_one)
      sleep(1)
      expect(page).to have_content('Comments:')
      expect(page).to have_content(@post_one.commentscounter)
    end

    it 'User should see the number of likes it has' do
      visit user_post_path(@user_one, @post_one)
      sleep(1)
      expect(page).to have_content('Likes:')
      expect(page).to have_content(@post_one.likescounter)
    end

    it 'User should see the comments and the users who commented' do
      visit user_post_path(@user_one, @post_one)
      sleep(1)
      expect(page).to have_content('hi nice to meet you')
      expect(page).to have_content('Lukman')
    end
  end
end
