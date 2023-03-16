# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "passW0rd" }
    trait :admin do
      admin { true }
    end
  end
end
