# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :find_post, only: %i[show like]

  def index
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = Comment.where(user_id: params[:user_id])
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def like
    @post.increment!(:likes_counter)
    redirect_to @post
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
