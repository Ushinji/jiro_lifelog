# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    sequence(:name) { |n| "TEST_MENU_NAME#{n}" }
  end
end
