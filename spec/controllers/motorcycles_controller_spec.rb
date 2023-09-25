# spec/controllers/api/v1/motorcycles_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::V1::MotorcyclesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      user = create(:user)
      sign_in user

      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user = create(:user)
      motorcycle = create(:motorcycle, user: user, photo: 'dummy_photo')
      sign_in user

      get :show, params: { id: motorcycle.id }

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
  it 'creates a new motorcycle' do
    user = create(:user)
    sign_in user

    initial_count = Motorcycle.count
    puts "Initial count: #{initial_count}"

    post :create, params: { motorcycle: attributes_for(:motorcycle, user: user, photo: 'dummy_photo', make: 'Honda') }

    expect(response).to have_http_status(:created), "Response body: #{response.body}"

    final_count = Motorcycle.count
    puts "Final count: #{final_count}"

    expect(final_count).to eq(initial_count + 1)

    motorcycle = Motorcycle.last
    puts "Motorcycle errors: #{motorcycle.errors.full_messages}" if motorcycle && motorcycle.errors.any?
  end
end

  describe 'DELETE #destroy' do
    it 'deletes the requested motorcycle' do
      user = create(:user)
      sign_in user

      motorcycle = create(:motorcycle, user: user, photo: 'dummy_photo')

      expect {
        delete :destroy, params: { id: motorcycle.id }
      }.to change(Motorcycle, :count).by(-1)

      expect(response).to have_http_status(:ok)
    end
  end
end
