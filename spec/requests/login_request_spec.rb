require 'rails_helper'

RSpec.describe 'Login Request', type: :request do
  it 'can login and recieve an api_key with proper credentials' do
    existing_user = {
                "email": "whatever@example.com",
                "password": "password"
    }.to_json

    headers = { 'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/sessions', params: existing_user, headers: headers

    user_key = JSON.parse(response.body)

    expect(response.code).to eq('200')
    expect(user_key).to have_key('data')
    expect(user_key['data']['attributes']['api_key']).to be_a(String)
  end
end

