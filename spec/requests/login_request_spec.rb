require 'rails_helper'

RSpec.describe 'Login Request', type: :request do
  it 'can login and recieve an api_key with proper credentials' do
    user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password', api_key: 'test-api-key')
    user_json = {
                "email": user.email,
                "password": 'password'
      }.to_json

    headers = { 'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/sessions', params: user_json, headers: headers

    user_key = JSON.parse(response.body)

    expect(response.code).to eq('200')
    expect(user_key).to have_key('data')
    expect(user_key['data']['attributes']['api_key']).to be_a(String)
  end
end

