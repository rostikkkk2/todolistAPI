require 'rails_helper'

RSpec.describe 'Complete', type: :request do
  include Docs::V1::Complete::Api

  describe 'PATCH #update' do
    include Docs::V1::Complete::Update

    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let(:task) { create(:task, project_id: project.id) }
    let(:headers) { authorization_header_for(user) }

    context 'when success complete' do
      before { patch api_v1_complete_path(task), headers: headers, as: :json }

      it 'when do complete task', :dox do
        expect(response).to have_http_status :ok
      end
      it { expect(Task.first.complete).to eq(true) }
    end

    context 'when success not complete' do
      let(:task_complete) { create(:task, project_id: project.id, complete: true) }

      before { patch api_v1_complete_path(task_complete), headers: headers, as: :json }

      it 'when do not complete task', :dox do
        expect(response).to have_http_status :ok
      end
      it { expect(Task.first.complete).to eq(false) }
    end

    context 'when failed' do
      let(:fail_id_task) { task.id + 1 }

      before { patch api_v1_complete_path(fail_id_task), headers: headers, as: :json }

      it 'fail complete task', :dox do
        expect(response).to have_http_status :not_found
      end
      it { expect(Task.first.complete).to eq(false) }
    end
  end
end
