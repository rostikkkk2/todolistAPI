require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'with database columns' do
    it { is_expected.to have_db_column(:body).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:photo).of_type(:string) }
    it { is_expected.to have_db_index(:task_id) }
  end

  context 'with assosiations' do
    it { is_expected.to belong_to(:task) }
  end
end
