require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Docs::V1::Users::Api

  describe 'POST /users' do
    include Docs::V1::Users::Create

    context 'when success' do
      let(:user_params) { attributes_for(:user) }
      let(:params) { { email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password] } }

      before { post api_v1_sign_up_path, params: params, as: :json }

      it 'create user by token', :dox do
        expect(response).to be_created
      end
      it { expect(User.count).to eq(1) }
    end

    context 'when failed' do
      let(:user_params) { attributes_for(:user) }
      let(:params) { {} }

      before { post api_v1_sign_up_path, params: params, as: :json }

      it 'create user by token', :dox do
        expect(response).to have_http_status 422
      end
      it { expect(User.all).to be_empty }
    end
  end
end
