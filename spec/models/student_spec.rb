require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:student)).to be_valid
  end

  describe 'it is invalid without' do
    it 'a name' do
      expect(FactoryGirl.build(:student, name: nil)).to_not be_valid
    end

    it 'a register_number' do
      expect(FactoryGirl.build(:student, register_number: nil)).to_not be_valid
    end

    it 'a status' do
      expect(FactoryGirl.build(:student, status: nil)).to_not be_valid
    end
  end

  describe 'limits' do
    it 'name to 45 characters' do
      expect(FactoryGirl.build(:student, name: Faker::Lorem.characters(46))).to_not be_valid
    end

    it 'register_number to 45 characters' do
      expect(FactoryGirl.build(:student, register_number: Faker::Lorem.characters(46))).to_not be_valid
    end
  end
end
