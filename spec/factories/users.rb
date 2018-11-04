# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    trait :user_User1 do
      username { 'User1' }
    end
  end
end
