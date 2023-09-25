require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  before do
    @user = create(:user)
    @motorcycle = create(:motorcycle, user: @user)
    @reservation = create(:reservation, user: @user, motorcycle: @motorcycle)
    sign_in @user
  end

  describe '#index' do
    it 'returns all of the reservations for the current user' do
      get :index
      expect(response.status).to eq(200)
      expect(json_response.count).to eq(1)
      expect(json_response.first['city']).to eq(@reservation.city)
    end
  end

  describe '#show' do
    it 'returns the reservation with the specified ID for the current user' do
      get :show, params: { id: @reservation.id }
      expect(response.status).to eq(200)
      expect(json_response['city']).to eq(@reservation.city)
    end
  end

  describe '#create' do
    it 'creates a new reservation for the current user with the specified parameters' do
      params = {
        start_date: Date.today + 1,
        end_date: Date.today + 7,
        city: 'New York, NY',
        user_id: @user.id,
        motorcycle_id: @motorcycle.id
      }

      post :create, params: params
      expect(response.status).to eq(201)
      expect(json_response['city']).to eq('New York, NY')
    end
  end

  describe '#destroy' do
    it 'deletes the reservation with the specified ID for the current user' do
      delete :destroy, params: { id: @reservation.id }
      expect(response.status).to eq(200)
      expect(Reservation.find_by(id: @reservation.id)).to be_nil
    end
  end
end
