class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = Comment.where(user_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
