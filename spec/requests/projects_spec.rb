require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  describe 'POST #create' do
    context 'when success' do
      let(:user) { create(:user) }

      # let(:headers) { authorization_header_for(user) }
      let(:tokens) { JWTSessions::Session.new(payload: { user_id: user.id }).login }
      let(:headers_data) do
        { 'HTTP_COOKIE': "#{JWTSessions.access_cookie}=#{tokens[:access]}", JWTSessions.csrf_header => tokens[:csrf] }
      end

      let(:params) { { name: 'TodoList' } }

      before { post projects_path, params: params, headers: headers_data, as: :json }

      it 'create project' do
        expect(response).to be_created
        expect(user.projects.count).to eq(1)
      end
    end

    context 'when failed' do
      let(:user) { create(:user) }
      let(:headers) { authorization_header_for(user) }
      let(:params) { { name: '' } }

      before { post projects_path, params: params, headers: headers, as: :json }

      it 'create project with wrong params' do
        expect(response).to have_http_status 422
        expect(user.projects).to be_empty
      end
    end
  end

  describe 'PUT #update' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:headers) { authorization_header_for(user) }

    context 'when success' do
      let(:params) { { name: Faker::Lorem.word } }

      before { put project_path(project), params: params, headers: headers, as: :json }

      it 'update project' do
        expect(response).to have_http_status 200
        expect(user.projects.first.name).to eq(params[:name])
      end
    end

    context 'when failed' do
      let(:failed_project_id) { project.id + 1 }
      let(:params) { {} }

      before { put project_path(failed_project_id), params: params, headers: headers, as: :json }

      it 'not update project' do
        expect(response).to have_http_status 404
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:headers) { authorization_header_for(user) }
    let(:failed_project_id) { project.id + 1 }

    before { delete project_path(project), headers: headers, as: :json }

    it 'delete project' do
      expect(response).to have_http_status 204
      expect(user.projects).to be_empty
    end
  end
end
