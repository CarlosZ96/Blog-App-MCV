class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
