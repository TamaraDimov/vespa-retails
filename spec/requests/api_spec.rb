require 'swagger_helper'

RSpec.describe 'API', type: :request do
  path '/api/v1/motorcycles' do
    get 'Retrieve all motorcycles' do
      tags 'Motorcycles'
      produces 'application/json'

      response '200', 'OK' do
        examples 'application/json' => [
          {
            id: 1,
            name: 'Motorcycle 1',
            model: 'Model 1',
            description: 'Description 1',
            photo: 'Photo 1',
            user_id: 1
          },
          {
            id: 2,
            name: 'Motorcycle 2',
            model: 'Model 2',
            description: 'Description 2',
            photo: 'Photo 2',
            user_id: 1
          }
        ]

        run_test!
      end

      response '404', 'Resource not found' do
        run_test!
      end
    end
