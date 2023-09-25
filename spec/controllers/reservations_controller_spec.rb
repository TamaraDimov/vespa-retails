# # spec/controllers/api/v1/reservations_controller_spec.rb

# require 'rails_helper'

# RSpec.describe Api::V1::ReservationsController, type: :controller do
#   describe 'GET #index' do
#     it 'returns a success response' do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe 'GET #show' do
#     it 'returns a success response' do
#       reservation = create(:reservation)

#       get :show, params: { id: reservation.id }

#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe 'POST #create' do
#     it 'creates a new reservation' do
#       motorcycle = create(:motorcycle)

#       expect {
#         post :create, params: { motorcycle_id: motorcycle.id }
#       }.to change(Reservation, :count).by(1)

#       expect(response).to have_http_status(:created)
#     end
#   end

#   describe 'DELETE #destroy' do
#     it 'deletes the requested reservation' do
#       reservation = create(:reservation)

#       expect {
#         delete :destroy, params: { id: reservation.id }
#       }.to change(Reservation, :count).by(-1)

#       expect(response).to have_http_status(:ok)
#     end
#   end
# end

# # spec/controllers/users/registrations_controller_spec.rb
# RSpec.describe Users::RegistrationsController, type: :controller do
#   describe 'POST #create' do
#     it 'creates a new user' do
#       expect {
#         post :create, params: { user: attributes_for(:user) }
#       }.to change(User, :count).by(1)

#       expect(response).to have_http_status(:created)
#     end
#   end
# end

# # spec/controllers/users/sessions_controller_spec.rb
# RSpec.describe Users::SessionsController, type: :controller do
#   describe 'POST #create' do
#     it 'returns a success response' do
#       user = create(:user)

#       post :create, params: { user: { email: user.email, password: user.password } }

#       expect(response).to have_http_status(:success)
#     end
#   end
# end
