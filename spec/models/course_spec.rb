require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:course)).to be_valid
  end

  describe 'it is invalid without' do
    it 'a name' do
      expect(FactoryGirl.build(:course, name: nil)).to_not be_valid
    end

    it 'a description' do
      expect(FactoryGirl.build(:course, description: nil)).to_not be_valid
    end

    it 'a status' do
      expect(FactoryGirl.build(:course, status: nil)).to_not be_valid
    end
  end

  describe 'limits' do
    it 'name to 45 characters' do
      expect(FactoryGirl.build(:course, name: Faker::Lorem.characters(46))).to_not be_valid
    end

    it 'description to 45 characters' do
      expect(FactoryGirl.build(:course, description: Faker::Lorem.characters(46))).to_not be_valid
    end
  end
end
