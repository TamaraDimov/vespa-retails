# require 'rails_helper'

# RSpec.describe Users::RegistrationsController, type: :controller do
#   describe 'POST #create' do
#     context 'with valid params' do
#       let(:valid_attributes) { { username: 'testuser', email: 'testuser@example.com', password: 'password' } }

#       it 'creates a new User' do
#         expect {
#           post :create, params: { user: valid_attributes }
#         }.to change(User, :count).by(1)
#       end

#       it 'renders a JSON response with the new user' do
#         post :create, params: { user: valid_attributes }
#         expect(response).to have_http_status(:created)
#         expect(response.content_type).to eq('application/json')
#         expect(response.location).to eq(root_url)
#       end
#     end

#     context 'with invalid params' do
#       let(:invalid_attributes) { { username: nil, email: nil, password: nil } }

#       it 'renders a JSON response with errors for the new user' do
#         post :create, params: { user: invalid_attributes }
#         expect(response).to have_http_status(:unprocessable_entity)
#         expect(response.content_type).to eq('application/json')
#       end
#     end
#   end
# end
