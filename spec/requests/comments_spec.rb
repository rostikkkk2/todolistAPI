require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, user_id: user.id) }
  let(:task) { create(:task, project_id: project.id) }
  let(:headers) { authorization_header_for(user) }

  describe 'POST #create' do
    context 'when success' do
      let(:params) { { body: 'test comment' } }

      before { post task_comments_path(task_id: task.id), headers: headers, params: params, as: :json }

      it 'create comment' do
        expect(response).to be_created
        expect(task.comments.count).to eq(1)
      end
    end

    context 'when failed' do
      let(:params) { { body: '' } }

      before { post task_comments_path(task_id: task.id), headers: headers, params: params, as: :json }

      it 'not create comment' do
        expect(response).to have_http_status 422
        expect(task.comments).to be_empty
      end
    end
  end

  describe 'POST #destroy' do
    let(:comment) { create(:comment, task_id: task.id) }

    before { delete comment_path(comment), headers: headers, as: :json }

    it 'destroy comment' do
      expect(response).to have_http_status 204
      expect(task.comments).to be_empty
    end
  end
end
