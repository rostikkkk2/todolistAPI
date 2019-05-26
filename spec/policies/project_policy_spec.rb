require 'rails_helper'

RSpec.describe ProjectPolicy, type: :policy do
  subject(:project_policy) { described_class.new(user, project) }

  let(:resolved_scope) { described_class::Scope.new(user, Project.all).resolve }
  let(:project) { create(:project) }
  let(:project1) { create(:project) }
  let(:actions) { %i[create destroy] }

  context 'when belongs to user' do
    let(:user) { project.user }

    it { is_expected.to permit_actions(actions) }
    it { expect(resolved_scope).to include(project) }
    it { expect(resolved_scope).not_to include(project1) }
  end
end
