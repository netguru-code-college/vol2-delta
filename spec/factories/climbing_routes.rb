# frozen_string_literal: true

FactoryBot.define do
  factory :climbing_route do
    sector
    route_grade

    name { "Route #{Faker::Lorem.word}" }
  end
end
