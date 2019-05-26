require 'rails_helper'

RSpec.describe TaskPolicy, type: :policy do
  subject(:task_policy) { described_class.new(user, task) }

  let(:resolved_scope) { described_class::Scope.new(user, Task.all).resolve }
  let(:task) { create(:task) }
  let(:task1) { create(:task) }
  let(:actions) { %i[create destroy] }

  context 'when belongs to user' do
    let(:user) { task.project.user }

    it { is_expected.to permit_actions(actions) }
    it { expect(resolved_scope).to include(task) }
    it { expect(resolved_scope).not_to include(task1) }
  end
end
