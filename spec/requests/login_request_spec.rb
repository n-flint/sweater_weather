require 'rails_helper'

RSpec.describe 'Login Request', type: :request do
  it 'can login with valid credentials and recieve api_key' do
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
  it 'can not login, receive 404 with invalid credintails' do
    user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password', api_key: 'test-api-key')
    user_json = {
                "email": 'whatever@example.com',
                "password": 'wrong_password'
      }.to_json

    headers = { 'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/sessions', params: user_json, headers: headers

    error = JSON.parse(response.body)

    expect(response.code).to eq('404')
    expect(error['error']).to eq('User Not Found')
  end
end

