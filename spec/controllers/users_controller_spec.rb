require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @users' do
      first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.', posts_counter: 0)
      first_user.update(posts_counter: first_user.posts.count)
      get :index
      expect(assigns(:users)).to eq([first_user])
    end
    it 'assigns @posts' do
      first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.', posts_counter: 0)
      first_post = Post.create(user: first_user, title: 'Hello im User 1', text: 'This is my first post')
      first_post.user.update(posts_counter: first_post.user.posts.count)

      get :index
      expect(assigns(:posts)).to eq([first_post])
    end
  end
  describe 'GET #show' do
    it 'returns a successful response' do
      first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.', posts_counter: 0)
      get :show, params: { id: first_user.id }
      expect(response).to be_successful
    end

    it 'renders the show template' do
      first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.', posts_counter: 0)
      get :show, params: { id: first_user.id }
      expect(response).to render_template('show')
    end

    it 'assigns @user' do
      first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.', posts_counter: 0)
      get :show, params: { id: first_user.id }
      expect(assigns(:user)).to eq(first_user)
    end

    it 'assigns @posts' do
      first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Mexico.', posts_counter: 0)
      first_post = Post.create(user: first_user, title: 'Hello im User 1', text: 'This is my first post')
      first_post.user.update(posts_counter: first_post.user.posts.count)

      get :show, params: { id: first_user.id }
      expect(assigns(:posts)).to eq([first_post])
    end
  end
end
