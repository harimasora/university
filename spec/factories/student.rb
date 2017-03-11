require 'faker'

FactoryGirl.define do
  factory :student do
    name { Faker::Name.name }
    register_number { Faker::Number }
    status {Faker::Number.between(0,1)}
  end

end
