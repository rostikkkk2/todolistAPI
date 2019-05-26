require 'rails_helper'

RSpec.describe 'Session', type: :request do
  describe 'POST #create' do
    context 'when success' do
      let(:user) { create(:user) }
      let(:headers) { authorization_header_for(user) }
      let(:params) { { email: user.email, password: user.password } }

      before { post '/sign_in', params: params, headers: headers, as: :json }

      it 'create user by token' do
        expect(response).to have_http_status 200
      end
    end

    context 'when failed' do
      let(:user) { create(:user) }
      let(:params) { { email: user.email, password: 'test' } }

      before { post '/sign_in', params: params }

      it 'create user by token' do
        expect(response).to have_http_status 401
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:headers) { authorization_header_for(user) }

    before { delete '/log_out', headers: headers, as: :json }

    it 'when destroy a session' do
      expect(response).to have_http_status 200
      expect(response.cookies[JWTSessions.access_cookie]).not_to be_present
    end
  end
end
