# # spec/controllers/api/v1/motorcycles_controller_spec.rb
# require 'rails_helper'

# RSpec.describe Api::V1::MotorcyclesController, type: :controller do
#   let(:user) { create(:user) }
#   let(:motorcycle) { create(:motorcycle, user: user) }

#   describe 'GET #index' do
#     it 'returns all motorcycles for the current user' do
#       sign_in(user)
#       get :index
#       expect(response).to have_http_status(:success)
#       expect(response.body).to include(motorcycle.name)
#     end

#     it 'returns not_found if no motorcycles are found' do
#       sign_in(user)
#       user.motorcycles.destroy_all
#       get :index
#       expect(response).to have_http_status(:not_found)
#       expect(response.body).to include('Resource not found')
#     end
#   end

#   describe 'GET #show' do
#     it 'returns a motorcycle if found' do
#       sign_in(user)
#       get :show, params: { id: motorcycle.id }
#       expect(response).to have_http_status(:success)
#       expect(response.body['id']).to eq(motorcycle.id)
#     end

#     it 'returns not_found if motorcycle is not found' do
#       sign_in(user)
#       get :show, params: { id: 999 }
#       expect(response).to have_http_status(:not_found)
#       expect(response.body).to include('Resource not found')
#     end
#   end

#   describe 'POST #create' do
#     let(:valid_params) { { name: 'Test Motorcycle', model: 'Model XYZ', description: 'Test Description', photo: 'photo_url' } }
#     let(:invalid_params) { { name: '', model: '', description: '', photo: '' } }

#     context 'with valid parameters' do
#       it 'creates a new motorcycle' do
#         sign_in(user)
#         expect {
#           post :create, params: valid_params
#         }.to change(Motorcycle, :count).by(1)
#         expect(response).to have_http_status(:created)
#         expect(response.body).to include('Created')
#       end
#     end

#     context 'with invalid parameters' do
#       it 'returns unprocessable_entity' do
#         sign_in(user)
#         post :create, params: invalid_params
#         expect(response).to have_http_status(:unprocessable_entity)
#         expect(response.body).to include('The request parameters are invalid')
#       end
#     end
#   end

#   describe 'DELETE #destroy' do
#     it 'deletes a motorcycle' do
#       sign_in(user)
#       delete :destroy, params: { id: motorcycle.id }
#       expect(response).to have_http_status(:ok)
#       expect(response.body).to include('Motorcycle deleted successfully')
#     end

#     it 'returns not_found if motorcycle is not found' do
#       sign_in(user)
#       delete :destroy, params: { id: 999 }
#       expect(response).to have_http_status(:not_found)
#       expect(response.body).to include('Motorcycle not found')
#     end
#   end
# end
