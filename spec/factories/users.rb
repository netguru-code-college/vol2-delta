# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@sandbag.com" }
    password  { 'Password' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    total_points { rand(10000)+50 }
  end
end
