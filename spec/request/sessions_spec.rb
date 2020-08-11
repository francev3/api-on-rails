require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'sessions API', type: :request do
  
  describe 'POST /api/v1/login' do
    

		
		context 'when the request is valid' do

			it 'creates a session' do
				user = User.create!(email: 'example@email.com', username:'example', role:1, password:'123456')
				
				post '/api/v1/login', params: { username:'example', password:'123456' }
				
        expect(json['ok']).to eq(true)
        expect(json['token']).not_to eq(nil)
      end

			it 'returns status code 200' do
				user = User.create!(email: 'example@email.com', username:'example', role:1, password:'123456')
				
				post '/api/v1/login', params: { username:'example', password:'123456' }

        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/login', params: { username:'example' } }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end

			it 'returns a validation failure message' do
				expect(json['ok']).to eq(false)
        expect(json['message']).to eq('Nombre de usuario o contraseña inválidos.')
      end
    end
  end

end