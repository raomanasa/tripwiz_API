require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :lat }
    it { is_expected.to have_db_column :lng }
    it { is_expected.to have_db_column :price }
    it { is_expected.to have_db_column :address }
    it { is_expected.to have_db_column :url }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:hotel)).to be_valid
    end
  end
end