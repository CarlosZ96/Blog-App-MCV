require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: '1' }
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get :show, params: { id: '1' }
      expect(response).to render_template('show')
    end
  end
end
