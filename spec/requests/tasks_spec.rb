require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  include Docs::V1::Tasks::Api

  describe 'POST #create' do
    include Docs::V1::Tasks::Create

    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:headers) { authorization_header_for(user) }

    context 'when success' do
      let(:attributes) { attributes_for(:task) }
      let(:params) { { name: attributes[:name] } }

      before { post api_v1_project_tasks_path(project_id: project.id), headers: headers, params: params, as: :json }

      it 'create task', :dox do
        expect(response).to have_http_status 201
      end
      it { expect(Task.count).to eq(1) }
    end

    context 'when failed' do
      let(:fail_project_id) { project.id + 1 }
      let(:params) { {} }

      before { post api_v1_project_tasks_path(fail_project_id), headers: headers, params: params, as: :json }

      it 'not create task', :dox do
        expect(response).to have_http_status 422
      end
      it { expect(Task.all).to be_empty }
    end
  end

  describe 'PUT #update' do
    include Docs::V1::Tasks::Update

    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:task) { create(:task, project_id: project.id) }
    let(:headers) { authorization_header_for(user) }

    context 'when success' do
      let(:attributes) { attributes_for(:task) }
      let(:params) { { name: attributes[:name], deadline: Time.now.next_week } }

      before { put api_v1_task_path(task), headers: headers, params: params, as: :json }

      it 'update task', :dox do
        expect(response).to have_http_status 200
      end
      it { expect(Task.first.deadline).to eq(params[:deadline]) }
      it { expect(Task.first.name).to eq(params[:name]) }
    end

    context 'when failed' do
      let(:params) { { name: '' } }

      before { put api_v1_task_path(task), headers: headers, params: params, as: :json }

      it 'not update task', :dox do
        expect(response).to have_http_status 404
      end
    end
  end

  describe 'DELETE #destroy' do
    include Docs::V1::Tasks::Destroy

    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:task) { create(:task, project_id: project.id) }
    let(:headers) { authorization_header_for(user) }

    before { delete api_v1_task_path(task), headers: headers, as: :json }

    it 'destroy task', :dox do
      expect(response).to have_http_status 204
    end
    it { expect(Task.all).to be_empty }
  end
end
