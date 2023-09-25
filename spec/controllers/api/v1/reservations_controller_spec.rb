require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  let(:user) { User.create(username: 'testuser', email: 'testuser@example.com', password: 'password') }
  let(:motorcycle) { Motorcycle.create(name: 'Test Motorcycle', model: 'Test Model', description: 'Test Description', photo: 'Test Photo', user: user) }
  let(:reservation) { Reservation.create(user: user, motorcycle: motorcycle, start_date: Date.today, end_date: Date.tomorrow) }
  let(:valid_attributes) { { user_id: user.id, motorcycle_id: motorcycle.id, start_date: Date.today, end_date: Date.tomorrow } }
  let(:invalid_attributes) { { user_id: nil, motorcycle_id: nil, start_date: nil, end_date: nil } }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: reservation.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Reservation' do
        expect {
          post :create, params: { reservation: valid_attributes }
        }.to change(Reservation, :count).by(1)
      end

      it 'renders a JSON response with the new reservation' do
        post :create, params: { reservation: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(api_v1_reservation_url(Reservation.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new reservation' do
        post :create, params: { reservation: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested reservation' do
      reservation = Reservation.create! valid_attributes
      expect {
        delete :destroy, params: { id: reservation.to_param }
      }.to change(Reservation, :count).by(-1)
    end
  end
end
