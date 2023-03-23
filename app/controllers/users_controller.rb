class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = @user.posts.order(created_at: :desc).limit(3)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end
end
