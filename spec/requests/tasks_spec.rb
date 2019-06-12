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

      before { post api_v1_project_tasks_path(project.id, id: project), headers: headers, params: params, as: :json }

      it 'create task', :dox do
        expect(response).to have_http_status :created
      end
      it { expect(Task.count).to eq(1) }
    end

    context 'when failed 404' do
      let(:fail_project_id) { project.id + 1 }
      let(:params) { {} }

      before { post api_v1_project_tasks_path(fail_project_id), headers: headers, params: params, as: :json }

      it 'not create task', :dox do
        expect(response).to have_http_status :not_found
      end
      it { expect(Task.all).to be_empty }
    end

    context 'when failed 422' do
      let(:params) { { name: '' } }

      before { post api_v1_project_tasks_path(project.id, id: project), headers: headers, params: params, as: :json }

      it 'not create task', :dox do
        expect(response).to have_http_status :unprocessable_entity
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
        expect(response).to have_http_status :ok
      end
      it { expect(Task.first.deadline).to eq(params[:deadline]) }
      it { expect(Task.first.name).to eq(params[:name]) }
    end

    context 'when failed 404' do
      let(:fail_task) { task.id + 1 }
      let(:params) { {} }

      before { put api_v1_task_path(fail_task), headers: headers, params: params, as: :json }

      it 'not update task', :dox do
        expect(response).to have_http_status :not_found
      end
    end

    context 'when failed 422' do
      let(:params) { { name: '' } }

      before { put api_v1_task_path(task), headers: headers, params: params, as: :json }

      it 'not update task', :dox do
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'DELETE #destroy' do
    include Docs::V1::Tasks::Destroy

    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:task) { create(:task, project_id: project.id) }
    let(:headers) { authorization_header_for(user) }

    context 'when success destroy task' do
      before { delete api_v1_task_path(task), headers: headers, as: :json }

      it 'success destroy task', :dox do
        expect(response).to have_http_status :no_content
      end
      it { expect(Task.all).to be_empty }
    end

    context 'when failed destroy task 404' do
      let(:fail_task_id) { task.id + 1 }

      before { delete api_v1_task_path(fail_task_id), headers: headers, as: :json }

      it 'failed destroy task', :dox do
        expect(response).to have_http_status :not_found
      end
      it { expect(Task.all).not_to be_empty }
    end
  end
end
