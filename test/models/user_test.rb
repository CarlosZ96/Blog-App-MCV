require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should return three most recent posts' do
    user = users(:one)

    # Creating three posts associated with the user
    post1 = Post.create(user:, title: 'Post 1', text: 'Content 1')
    post2 = Post.create(user:, title: 'Post 2', text: 'Content 2')
    post3 = Post.create(user:, title: 'Post 3', text: 'Content 3')

    # Make sure the user has three posts
    assert_equal 3, user.posts.count

    # Call the method
    recent_posts = user.three_most_recent_posts

    # Assertions
    assert_equal 3, recent_posts.count
    assert_equal post3.id, recent_posts.first.id
    assert_equal post2.id, recent_posts.second.id
    assert_equal post1.id, recent_posts.third.id
  end
end
