require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'John', posts_counter: 0)
    @post = Post.create(user: @user, title: 'Test Post', comments_counter: 0, likes_counter: 0)
    @like = Like.create(user: @user, post: @post)
  end

  test 'like is valid' do
    assert @like.valid?
  end

  test 'updates the post likes counter' do
    assert_equal 0, @post.likes_counter

    @like.update_likes_counter

    assert_equal 1, @post.reload.likes_counter
  end
end
