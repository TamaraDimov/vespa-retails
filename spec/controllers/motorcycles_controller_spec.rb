require 'rails_helper'

RSpec.describe Api::V1::MotorcyclesController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let!(:motorcycle1) { create(:motorcycle, user: user) }
    let!(:motorcycle2) { create(:motorcycle, user: user) }
    let!(:motorcycle3) { create(:motorcycle) }

    before do
      sign_in user
      get :index
    end

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end

    it 'returns all motorcycles for the current user' do
      expect(assigns(:motorcycles)).to match_array([motorcycle1, motorcycle2])
    end
  end

  describe 'GET #show' do
    let(:motorcycle) { create(:motorcycle) }

    before do
      get :show, params: { id: motorcycle.id }
    end

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end

    it 'returns the correct motorcycle' do
      expect(assigns(:motorcycle)).to eq(motorcycle)
    end
  end

  describe 'POST #create' do
    context 'when valid parameters are provided' do
      let(:user) { create(:user) }
      let(:valid_params) { { motorcycle: { make: 'My Motorcycle', model: 'My Motorcycle Model', year: '2021' } } }

      before do
        sign_in user
      end

      it 'creates a new motorcycle' do
        expect do
          post :create, params: valid_params
        end.to change(Motorcycle, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: valid_params
        expect(response).to have_http_status(200)
      end
    end

    context 'when invalid parameters are provided' do
      let(:user) { create(:user) }
      let(:invalid_params) { { motorcycle: { make: '', model: 'My Motorcycle Model', year: '2021' } } }

      before do
        sign_in user
        post :create, params: invalid_params
      end

      it 'does not create a new motorcycle' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Motorcycle, :count)
      end

      it 'returns an error response with error details' do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response_body['errors']).to be_present
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let!(:motorcycle) { create(:motorcycle, user: user) }

    before do
      sign_in user
      delete :destroy, params: { id: motorcycle.id }
    end

    it 'deletes the motorcycle' do
      expect(Motorcycle.find_by(id: motorcycle.id)).to be_nil
    end

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end
  end

  def response_body
    JSON.parse(response.body)
  end
end
