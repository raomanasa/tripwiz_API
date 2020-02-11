RSpec.describe Activity, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :address }
    it { is_expected.to have_db_column :rating }
    it { is_expected.to have_db_column :lat }
    it { is_expected.to have_db_column :lng }
    it { is_expected.to have_db_column :activity_type_id }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :activity_type }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:activity)).to be_valid
    end
  end
end
