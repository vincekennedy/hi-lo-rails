require 'rails_helper'

RSpec.describe 'API::V1::Sessions', type: :request do
  describe 'POST /api/v1/login' do
    let!(:user) { User.create!(name: 'test', email: 'testuser@example.com', password: 'password', password_confirmation: 'password') }
  
    it 'authenticates the user and returns a token' do
      post '/api/v1/login', params: { email: user.email, password: 'password' }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to have_key('token')
    end
  end

    # context 'with invalid credentials' do
    #   it 'returns an error message when the credentials are invalid' do
    #     # Make the POST request with invalid credentials
    #     post '/api/v1/login', params: { email: 'testuser@example.com', password: 'wrongpassword' }

    #     # Check the response status (expecting unauthorized)
    #     expect(response).to have_http_status(:unauthorized)

    #     # Check for error message
    #     expect(json_response['error']).to eq('Invalid credentials')
    #   end
    # end
end
