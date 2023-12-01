# spec/controllers/users_controller_spec.rb
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
      user = create(:user)
      get :index
      expect(assigns(:users)).to eq([user])
    end

    it 'assigns @posts' do
      user = create(:user)
      post = create(:post, user:)
      get :index
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it 'renders the show template' do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(response).to render_template('show')
    end

    it 'assigns @user' do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns @posts' do
      user = create(:user)
      post = create(:post, user:)
      get :show, params: { id: user.id }
      expect(assigns(:posts)).to eq([post])
    end
  end
end
