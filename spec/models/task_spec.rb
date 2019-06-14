require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'with database columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:complete).of_type(:boolean).with_options(default: false) }
    it { is_expected.to have_db_column(:deadline).of_type(:datetime) }
    it { is_expected.to have_db_column(:position).of_type(:integer) }
    it { is_expected.to have_db_index(:project_id) }
  end

  context 'with assosiations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:comments) }
  end
end
