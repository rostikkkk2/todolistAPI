require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  include Docs::V1::Projects::Api

  describe 'POST #create' do
    include Docs::V1::Projects::Create

    context 'when success' do
      let(:user) { create(:user) }

      let(:headers) { authorization_header_for(user) }
      let(:params) { { name: 'TodoList' } }

      before { post api_v1_projects_path, params: params, headers: headers, as: :json }

      it 'create project', :dox do
        expect(response).to be_created
      end

      it { expect(user.projects.count).to eq(1) }
    end

    context 'when failed' do
      let(:user) { create(:user) }
      let(:headers) { authorization_header_for(user) }
      let(:params) { { name: '' } }

      before { post api_v1_projects_path, params: params, headers: headers, as: :json }

      it 'create project with wrong params', :dox do
        expect(response).to have_http_status 422
      end

      it { expect(user.projects).to be_empty }
    end
  end

  describe 'PUT #update' do
    include Docs::V1::Projects::Update

    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:headers) { authorization_header_for(user) }

    context 'when success' do
      let(:params) { { name: Faker::Lorem.word } }

      before { put api_v1_project_path(project), params: params, headers: headers, as: :json }

      it 'update project', :dox do
        expect(response).to have_http_status 200
      end

      it { expect(user.projects.first.name).to eq(params[:name]) }
    end

    context 'when failed' do
      let(:failed_project_id) { project.id + 1 }
      let(:params) { {} }

      before { put api_v1_project_path(failed_project_id), params: params, headers: headers, as: :json }

      it 'not update project', :dox do
        expect(response).to have_http_status 404
      end
    end
  end

  describe 'DELETE #destroy' do
    include Docs::V1::Projects::Destroy

    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:headers) { authorization_header_for(user) }
    let(:failed_project_id) { project.id + 1 }

    before { delete api_v1_project_path(project), headers: headers, as: :json }

    it 'delete project', :dox do
      expect(response).to have_http_status 204
    end

    it { expect(user.projects).to be_empty }
  end
end
