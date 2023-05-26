require 'rails_helper'

RSpec.describe 'Test for the user show page', type: :system do
  context 'Check the right content for user show page' do
    before(:each) do
      @new_user = User.create(name: 'Yash',
                              photo: 'https://www.anisearch.de/images/character/cover/full/0/817.webp',
                              bio: 'software engineer', postscounter: 0)
      @post_one = Post.create(user: @new_user, title: 'Hello', text: 'this is my first post', commentscounter: 0,
                              likescounter: 0)
      @post_two = Post.create(user: @new_user, title: 'jobs', text: 'I am gonna get a job in May', commentscounter: 0,
                              likescounter: 0)
      @post_three = Post.create(user: @new_user, title: 'life', text: 'I will get out of this life',
                                commentscounter: 0, likescounter: 0)
      @post_four = Post.create(user: @new_user, title: 'relocation', text: 'I will go to Singapore',
                               commentscounter: 0, likescounter: 0)
      @post_five = Post.create(user: @new_user, title: 'Nizam', text: 'I will visit Europe', commentscounter: 0,
                               likescounter: 0)
    end

    it 'User should see the other user\'s profile picture' do
      visit user_path(@new_user)
      expect(page).to have_selector('img')
    end

    it 'User should see the user\'s username' do
      visit user_path(@new_user)
      expect(page).to have_content('Yash')
    end

    it 'User should see the number of posts the user has written' do
      visit user_path(@new_user)
      expect(page).to have_content('Yash')
    end

    it 'User should see the user\'s bio' do
      visit user_path(@new_user)
      expect(page).to have_content('software engineer')
    end

    it 'User should see the user\'s recent posts' do
      visit user_path(@new_user)
      expect(page).to have_content('relocation')
      expect(page).to have_content('life')
    end

    it 'User should see a button that lets me view all of a user\'s posts' do
      visit user_path(@new_user)
      expect(page).to have_content('See all the posts')
    end

    it 'User clicks "See all the posts" and it redirects to the user\'s post\'s index page' do
      visit user_path(@new_user)
      click_link 'See all the posts'
      expect(page).to have_content('relocation')
    end
  end
end
