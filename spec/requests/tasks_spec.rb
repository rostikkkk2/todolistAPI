require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:headers) { authorization_header_for(user) }

    context 'when success' do
      let(:attributes) { attributes_for(:task) }
      let(:params) { { name: attributes[:name], project_id: project.id } }

      before { post tasks_path, headers: headers, params: params, as: :json }

      it 'create task' do
        expect(response).to have_http_status 201
      end
    end

    context 'when failed' do
      let(:params) { {} }

      before { post tasks_path, headers: headers, params: params, as: :json }

      it 'not create task' do
        expect(response).to have_http_status 422
      end
    end
  end

  describe 'PUT #update' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:task) { create(:task, project_id: project.id) }
    let(:headers) { authorization_header_for(user) }

    context 'when success' do
      let(:attributes) { attributes_for(:task) }
      let(:params) { { name: attributes[:name] } }

      before { put task_path(task), headers: headers, params: params, as: :json }

      it 'update task' do
        expect(response).to have_http_status 200
      end
    end

    context 'when failed' do
      let(:params) { { name: '' } }

      before { put task_path(task), headers: headers, params: params, as: :json }

      it 'not update task' do
        expect(response).to have_http_status 422
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:task) { create(:task, project_id: project.id) }
    let(:headers) { authorization_header_for(user) }

    before { delete task_path(task), headers: headers, as: :json }

    it 'destroy task' do
      expect(response).to have_http_status 204
    end
  end
end
