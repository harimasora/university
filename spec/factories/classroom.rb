require 'faker'

FactoryGirl.define do
  factory :classroom do
    student { FactoryGirl.create(:student) }
    course { FactoryGirl.create(:course) }
    entry_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end

end
