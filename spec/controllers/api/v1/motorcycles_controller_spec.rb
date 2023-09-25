require 'rails_helper'

RSpec.describe Api::V1::MotorcyclesController, type: :controller do
  let(:user) { User.create(username: 'testuser', email: 'testuser@example.com', password: 'password') }
  let(:motorcycle) { Motorcycle.create(name: 'Test Motorcycle', model: 'Test Model', description: 'Test Description', photo: 'Test Photo', user: user) }
  let(:valid_attributes) { { name: 'Test Motorcycle', model: 'Test Model', description: 'Test Description', photo: 'Test Photo' } }
  let(:invalid_attributes) { { name: nil, model: nil, description: nil, photo: nil } }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: motorcycle.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Motorcycle' do
        expect {
          post :create, params: { motorcycle: valid_attributes }
        }.to change(Motorcycle, :count).by(1)
      end

      it 'renders a JSON response with the new motorcycle' do
        post :create, params: { motorcycle: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(api_v1_motorcycle_url(Motorcycle.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new motorcycle' do
        post :create, params: { motorcycle: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested motorcycle' do
      motorcycle = Motorcycle.create! valid_attributes
      expect {
        delete :destroy, params: { id: motorcycle.to_param }
      }.to change(Motorcycle, :count).by(-1)
    end
  end
end
