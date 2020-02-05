require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :password }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content } 
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryBot.create(:user)).to be_valid 
    end
  end
end