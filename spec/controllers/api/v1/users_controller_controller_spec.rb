# spec/controllers/api/v1/users_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #show' do
    it 'returns the user if found' do
      sign_in(user)
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
      expect(response.body['id']).to eq(user.id)
    end

    it 'returns not_found if the user is not found' do
      sign_in(user)
      get :show, params: { id: 999 }
      expect(response).to have_http_status(:not_found)
      expect(response.body).to include('Resource not found')
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { email: 'test@example.com', password: 'password' } }
    let(:invalid_params) { { email: '', password: '' } }

    context 'with valid parameters' do
      it 'creates a new user' do
        expect do
          post :create, params: valid_params
        end.to change(User, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response.body).to include('Created')
      end
    end

    context 'with invalid parameters' do
      it 'returns unprocessable_entity' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('The request parameters are invalid')
      end
    end
  end

  describe 'PATCH #update' do
    it 'updates the user' do
      sign_in(user)
      patch :update, params: { id: user.id, name: 'New Name' }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('User updated successfully')
      user.reload
      expect(user.name).to eq('New Name')
    end

    it 'returns not_found if the user is not found' do
      sign_in(user)
      patch :update, params: { id: 999, name: 'New Name' }
      expect(response).to have_http_status(:not_found)
      expect(response.body).to include('User not found')
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the user' do
      sign_in(user)
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('User deleted successfully')
    end

    it 'returns not_found if the user is not found' do
      sign_in(user)
      delete :destroy, params: { id: 999 }
      expect(response).to have_http_status(:not_found)
      expect(response.body).to include('User not found')
    end
  end
end
