# require 'rails_helper'

# RSpec.describe AuthenticationTokenService do
#   let(:user) { User.create(username: 'testuser', email: 'testuser@example.com', password: 'password') }

#   describe '.call' do
#     it 'returns an authentication token' do
#       token = described_class.call(user.id)
#       expect(token).not_to be_nil
#     end
#   end

#   describe '.decode' do
#     it 'decodes an authentication token' do
#       token = described_class.call(user.id)
#       decoded_token = described_class.decode(token)
#       expect(decoded_token).to eq({ 'user_id' => user.id })
#     end

#     it 'returns false for an invalid token' do
#       decoded_token = described_class.decode('invalidtoken')
#       expect(decoded_token).to be_falsey
#     end
#   end

#   describe '.valid_payload' do
#     it 'returns true for a valid payload' do
#       payload = { 'user_id' => user.id }
#       expect(described_class.valid_payload(payload)).to be_truthy
#     end

#     it 'returns false for an invalid payload' do
#       payload = { 'user_id' => 'invaliduserid' }
#       expect(described_class.valid_payload(payload)).to be_falsey
#     end
#   end

#   describe '.expired_token' do
#     it 'returns an error response' do
#       response = described_class.expired_token
#       expect(response).to be_a(ActionController::Response)
#       expect(response.status).to eq(401)
#       expect(response.content_type).to eq('application/json')
#       expect(response.body).to eq({ error: 'Invalid or missing token! Please login again' }.to_json)
#     end
#   end
# end
