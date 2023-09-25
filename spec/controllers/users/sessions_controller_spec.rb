require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  let(:user) { User.create(username: 'testuser', email: 'testuser@example.com', password: 'password') }

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { { email: user.email, password: user.password } }

      it 'returns a success response' do
        post :create, params: { user: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { email: user.email, password: 'wrongpassword' } }

      it 'returns an unauthorized response' do
        post :create, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'returns a success response' do
      delete :destroy
      expect(response).to have_http_status(:ok)
    end
  end
end
