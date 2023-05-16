# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    sequence(:name) { |i| "Board #{i}" }
    sequence(:email) { |i| "user_#{i}@example.com" }
    matrix { [true] }
  end
end
