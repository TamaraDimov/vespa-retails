require 'rails_helper'

RSpec.describe CurrentUserController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }

    before do
      sign_in user
      get :index
    end

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end

    it 'returns the current user' do
      expect(response_body['username']).to eq(user.username)
      expect(response_body['email']).to eq(user.email)
    end
  end

  def response_body
    JSON.parse(response.body)
  end
end
