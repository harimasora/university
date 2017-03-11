require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:classroom)).to be_valid
  end

  describe 'it is invalid without' do
    it 'a student' do
      expect(FactoryGirl.build(:classroom, student: nil)).to_not be_valid
    end

    it 'a course' do
      expect(FactoryGirl.build(:classroom, course: nil)).to_not be_valid
    end
  end

  it 'generates entry_at on create' do
    classroom = FactoryGirl.build(:classroom, entry_at: nil)
    classroom.save!
    expect(classroom.entry_at).to_not be_nil
  end
end
