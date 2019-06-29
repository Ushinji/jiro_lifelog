# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    user

    size { "small" }
    yasai { "normal" }
    ninniku { "small" }
    abura { "normal" }
    karame { "small" }
    image_url { nil }
    calorie { nil }
  end
end
