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
      let(:request_task) { post api_v1_project_tasks_path(project.id, id: project), headers: headers, params: params, as: :json }

      it 'create task', :dox do
        expect { request_task }.to change(Task, :count).from(0).to(1)
        expect(response).to have_http_status :created
      end
    end

    context 'when failed 404' do
      let(:fail_project_id) { project.id + 1 }
      let(:params) { {} }

      before { post api_v1_project_tasks_path(fail_project_id), headers: headers, params: params, as: :json }

      it 'not create task', :dox do
        expect(Task.all).to be_empty
        expect(response).to have_http_status :not_found
      end
    end

    context 'when failed 422' do
      let(:params) { { name: '' } }

      before { post api_v1_project_tasks_path(project.id, id: project), headers: headers, params: params, as: :json }

      it 'not create task', :dox do
        expect(Task.all).to be_empty
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'PUT #update' do
    include Docs::V1::Tasks::Update

    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let!(:task) { create(:task, project_id: project.id) }
    let(:headers) { authorization_header_for(user) }

    context 'when success' do
      let(:attributes) { attributes_for(:task) }
      let(:params) { { name: attributes[:name], deadline: Time.now.next_week } }
      let(:request_task) { put api_v1_task_path(task), headers: headers, params: params, as: :json }

      it 'update task', :dox do
        expect { request_task }.to change { Task.first.deadline }
          .from(task.deadline).to(params[:deadline]).and change { Task.first.name }.from(task.name).to(params[:name])
        expect(response).to have_http_status :ok
      end
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
        expect(Task.all).to be_empty
        expect(response).to have_http_status :no_content
      end
    end

    context 'when failed destroy task 404' do
      let(:fail_task_id) { task.id + 1 }

      before { delete api_v1_task_path(fail_task_id), headers: headers, as: :json }

      it 'failed destroy task', :dox do
        expect(Task.all).not_to be_empty
        expect(response).to have_http_status :not_found
      end
    end
  end
end
