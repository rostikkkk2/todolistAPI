require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'with database columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_index(:user_id) }
  end

  context 'with assosiations' do
    it { is_expected.to belong_to(:user) }
  end
end
