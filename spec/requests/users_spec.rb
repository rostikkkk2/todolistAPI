require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST #create' do
    context 'when success' do
      let(:user_params) { attributes_for(:user) }
      let(:params) { { email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password] } }

      before { post '/sign_up', params: params, as: :json }

      it 'create user by token' do
        expect(response).to be_created
        expect(User.count).to eq(1)
      end
    end

    context 'when failed' do
      let(:user_params) { attributes_for(:user) }
      let(:params) { {} }

      before { post '/sign_up', params: params, as: :json }

      it 'create user by token' do
        expect(response).to have_http_status 422
        expect(User.all).to be_empty
      end
    end
  end
end
