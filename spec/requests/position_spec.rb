require 'rails_helper'

RSpec.describe 'Position Task', type: :request do
  include Docs::V1::Position::Api

  describe 'PUT #update' do
    include Docs::V1::Position::Update

    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let!(:task1) { create(:task, project_id: project.id, position: 1) }
    let!(:task2) { create(:task, project_id: project.id, position: 2) }
    let!(:task3) { create(:task, project_id: project.id, position: 3) }
    let(:headers) { authorization_header_for(user) }

    context 'when change position success up' do
      let(:params) { { position: :up } }
      let(:request_position) { put api_v1_position_path(task2), params: params, headers: headers, as: :json }

      it 'task position up', :dox do
        expect { request_position }.to change { Task.find_by(id: task1.id).position }
          .from(1).to(2).and change { Task.find_by(id: task2.id).position }.from(2).to(1)
        expect(response).to have_http_status :ok
      end
    end

    context 'when change position success down' do
      let(:params) { { position: :down } }
      let(:request_position) { put api_v1_position_path(task2), params: params, headers: headers, as: :json }

      it 'task position down', :dox do
        expect { request_position }.to change { Task.find_by(id: task2.id).position }
          .from(2).to(3).and change { Task.find_by(id: task3.id).position }.from(3).to(2)
        expect(response).to have_http_status :ok
      end
    end

    context 'when failure' do
      let(:fail_task_id) { 5 }
      let(:params) { {} }

      before { put api_v1_position_path(fail_task_id), params: params, headers: headers, as: :json }

      it 'return 404', :dox do
        expect(response).to have_http_status :not_found
      end
    end
  end
end
