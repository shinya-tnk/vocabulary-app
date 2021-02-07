# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 3, min_numeric: 3) }
    password_confirmation { password }
  end
end
