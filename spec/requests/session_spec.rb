require 'rails_helper'

RSpec.describe 'Session', type: :request do
  include Docs::V1::Session::Api

  describe 'POST #create' do
    include Docs::V1::Session::Create

    context 'when success' do
      let(:user) { create(:user) }
      let(:headers) { authorization_header_for(user) }
      let(:params) { { email: user.email, password: user.password } }

      before { post api_v1_sign_in_path, params: params, headers: headers, as: :json }

      it 'create user by token', :dox do
        expect(response).to have_http_status :ok
      end
    end

    context 'when failed' do
      let(:user) { create(:user) }
      let(:params) { { email: user.email, password: 'test' } }

      before { post api_v1_sign_in_path, params: params }

      it 'create user by token', :dox do
        expect(response).to have_http_status :unauthorized
      end
    end
  end

  describe 'DELETE #destroy' do
    include Docs::V1::Session::Destroy

    let(:user) { create(:user) }
    let(:headers) { authorization_header_for(user) }

    before { delete api_v1_log_out_path, headers: headers, as: :json }

    it 'when destroy a session', :dox do
      expect(response.cookies[JWTSessions.access_cookie]).not_to be_present
      expect(response).to have_http_status :ok
    end
  end
end
