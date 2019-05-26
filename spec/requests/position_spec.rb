require 'rails_helper'

RSpec.describe 'Position Task', type: :request do
  describe 'PUT #update' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }
    let!(:task1) { create(:task, project_id: project.id, position: 1) }
    let!(:task2) { create(:task, project_id: project.id, position: 2) }
    let!(:task3) { create(:task, project_id: project.id, position: 3) }
    let(:headers) { authorization_header_for(user) }

    context 'when change position success up' do
      let(:params) { { position: :up } }

      before { put position_path(task2), params: params, headers: headers, as: :json }

      it 'task position up' do
        expect(response).to have_http_status 200
        expect(Task.find_by(id: task2.id).position).to eq(1)
        expect(Task.find_by(id: task1.id).position).to eq(2)
      end
    end

    context 'when change position success down' do
      let(:params) { { position: :down } }

      before { put position_path(task2), params: params, headers: headers, as: :json }

      it 'task position down' do
        expect(response).to have_http_status 200
        expect(Task.find_by(id: task2.id).position).to eq(3)
        expect(Task.find_by(id: task3.id).position).to eq(2)
      end
    end

    context 'when failure' do
      let(:params) { {} }

      before { put position_path(task2), params: params, headers: headers, as: :json }

      it 'return 404' do
        expect(response).to have_http_status 404
      end
    end
  end
end
