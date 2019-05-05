# frozen_string_literal: true

FactoryBot.define do
  factory :sector do
    crag

    name { "Sector-#{Faker::Lorem.word}" }
    aspect { Faker::Lorem.word }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
