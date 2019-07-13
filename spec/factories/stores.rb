# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    sequence(:name) { |n| "TEST_STORE_NAME#{n}" }
  end
end
