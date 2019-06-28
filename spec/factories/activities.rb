# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    user

    size { "small" }
    yasai { "normal" }
    ninniku { "small" }
    abura { "normal" }
    karame { "small" }
    image_url { "http://test.image.url/1234.jpeg" }
    calorie { 1234 }
  end
end
