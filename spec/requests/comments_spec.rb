require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  include Docs::V1::Comments::Api

  let(:user) { create(:user) }
  let(:project) { create(:project, user_id: user.id) }
  let(:task) { create(:task, project_id: project.id) }
  let(:headers) { authorization_header_for(user) }

  describe 'POST #create' do
    include Docs::V1::Comments::Create

    context 'when success' do
      let(:params) { { body: 'test comment' } }

      before { post api_v1_task_comments_path(task_id: task.id), headers: headers, params: params, as: :json }

      it 'create comment', :dox do
        expect(response).to be_created
      end
      it { expect(task.comments.count).to eq(1) }
    end

    context 'when failed' do
      let(:params) { { body: '' } }

      before { post api_v1_task_comments_path(task_id: task.id), headers: headers, params: params, as: :json }

      it 'not create comment', :dox do
        expect(response).to have_http_status 422
      end
      it { expect(task.comments).to be_empty }
    end
  end

  describe 'POST #destroy' do
    include Docs::V1::Comments::Destroy

    let(:comment) { create(:comment, task_id: task.id) }

    before { delete api_v1_comment_path(comment), headers: headers, as: :json }

    it 'destroy comment', :dox do
      expect(response).to have_http_status 204
    end
    it { expect(task.comments).to be_empty }
  end
end
