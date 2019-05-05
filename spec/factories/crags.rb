# frozen_string_literal: true

FactoryBot.define do
  factory :crag do
    name { Faker::Address.city }
    country { Faker::Address.country }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
