require 'rails_helper'
require 'devise/jwt/test_helpers'


RSpec.describe 'user API', type: :request do

	
	users = [
		user = User.create!(email: 'administrador@email.com', username:'administrador', role:1, password:'123456'),
		user = User.create!(email: 'userrol1@email.com', username:'userrol1', role:2, password:'123456'),
		user = User.create!(email: 'userrol2@email.com', username:'userrol2', role:3, password:'123456')
	]

	headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
	let (:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, users.first) }
	
	let(:user_id) { users.last.id }

  describe 'GET /api/v1/user/:id' do

		before { get "/api/v1/user/#{user_id}", headers: auth_headers }

    context 'when the record exists' do
			it 'returns the article' do
        expect(json).not_to be_empty
        expect(json['ok']).to eq(true)
        expect(json['user']['id']).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
		end

    context 'when the record does not exist' do
      let(:user_id) { 100 }

			it 'returns an exception' do
				expect(json["ok"]).to eq(false)
				expect(json["message"]).to eq("Usuario no encontrado.")
			end
		end

		context 'when the user have a invalid token' do
      let(:auth_headers) { {'Authorization': '434343'} }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns a not found message' do
        expect(json['ok']).to eq(false)
        expect(json['message']).to eq('Tienes que iniciar sesión o registrarte para poder continuar.')
      end
		end

		context 'when the user have not permission' do
      let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, users[1]) }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns a not found message' do
        expect(json['ok']).to eq(false)
        expect(json['message']).to eq('No puedes realizar esta acción.')
      end
		end

	end




  describe 'PUT /api/v1/user/:id' do
    let(:valid_attributes) { { :user => {:username => "otrouser"} }.to_json }

    context 'when the record exists' do
      before { put "/api/v1/user/#{user_id}", params: valid_attributes, headers: auth_headers }

      it 'updates the record' do
        expect(json["ok"]).to eq(true)
        expect(json["user"]["username"]).to eq("otrouser")
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

end


  