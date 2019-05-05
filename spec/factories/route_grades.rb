# frozen_string_literal: true

FactoryBot.define do
  factory :route_grade do
    grade { "#{rand(5..9)}#{%w(a b c).sample}" }
    points { rand(100...1250) }
  end
end
