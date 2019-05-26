require 'rails_helper'

RSpec.describe CommentPolicy, type: :policy do
  subject(:comment_policy) { described_class.new(user, comment) }

  let(:resolved_scope) { described_class::Scope.new(user, Comment.all).resolve }
  let(:comment) { create(:comment) }
  let(:comment1) { create(:comment) }
  let(:actions) { [:create, :destroy] }

  context 'when belongs to user' do
    let(:user) { comment.task.project.user }

    it { is_expected.to permit_actions(actions) }
    it { expect(resolved_scope).to include(comment) }
    it { expect(resolved_scope).not_to include(comment1) }
  end
end
