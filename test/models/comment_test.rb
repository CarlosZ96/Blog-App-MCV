require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'John', posts_counter: 0)
    @post = Post.create(user: @user, title: 'Test Post', comments_counter: 0, likes_counter: 0)
    @comment = Comment.create(user: @user, post: @post, content: 'Test Comment')
  end

  test 'comment is valid' do
    assert @comment.valid?
  end

  test 'update_comments_counter updates the post comments counter' do
    assert_equal 0, @post.comments_counter

    @comment.update_comments_counter

    assert_equal 1, @post.reload.comments_counter
  end
end
