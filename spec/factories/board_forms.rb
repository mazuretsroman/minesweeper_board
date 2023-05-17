# frozen_string_literal: true

FactoryBot.define do
  factory :board_form do
    trait :valid do
      sequence(:name) { |i| "Board #{i}" }
      sequence(:email) { |i| "user_#{i}@example.com" }
      width { rand(1..50) }
      height { rand(1..50) }
      mines { rand(0..2500) }
    end

    trait :invalid do
      name { '' }
      email { nil }
    end
  end
end
