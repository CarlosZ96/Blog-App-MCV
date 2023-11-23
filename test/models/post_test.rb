require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'John', posts_counter: 0)
    @post = Post.create(user: @user, title: 'Test Post', comments_counter: 0, likes_counter: 0)
  end

  test 'post is valid' do
    assert @post.valid?
  end

  test 'post must have a title' do
    @post.title = nil
    assert_not @post.valid?, 'Post should be invalid without a title'
  end

  test 'five most recent comments returns the correct number of comments' do
    6.times { |n| @post.comments.create(content: "Comment #{n}") }

    recent_comments = @post.five_most_recent_comments

    assert_equal 5, recent_comments.length
    assert_equal 'Comment 5', recent_comments.first.content
  end

  test 'updates the user posts counter' do
    assert_equal 0, @user.posts_counter

    @post.update_user_post_counter

    assert_equal 1, @user.reload.posts_counter
  end
end
