require 'rails_helper'

RSpec.describe 'Account Creation Request', type: :request do
  it 'can create an acount and return an api key' do
    new_user = {
                "email": "whatever@example.com",
                "password": "password",
                "password_confirmation": "password"
    }.to_json

    headers = { 'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/users', params: new_user, headers: headers

    key = JSON.parse(response.body)

    expect(response.code).to eq('201')
    expect(key['data']['attributes']['key']).to be_a(String)
  end
end