require 'faker'

FactoryGirl.define do
  factory :course do
    name { Faker::Name.name }
    description { Faker::Lorem.words(3) }
    status {Faker::Number.between(0,1)}
  end

end
