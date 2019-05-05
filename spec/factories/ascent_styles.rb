# frozen_string_literal: true

FactoryBot.define do
  factory :ascent_style do
    style { 'RP' }
    points { 0 }

    trait :os do
      style { 'OS' }
      points { 150 }
    end

    trait :flash do
      style { 'FL' }
      points { 100 }
    end
  end
end
