# frozen_string_literal: true

FactoryBot.define do
  factory :ascent do
    user
    climbing_route
    ascent_style
    
    date { Date.current }

    trait :with_comment do
      comment { Faker::Lorem.sentence }
    end
  end
end
