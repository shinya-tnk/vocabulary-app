# frozen_string_literal: true

FactoryBot.define do
  factory :vocabulary do
    word { 'aaaa' }
    description1 { 'あああ' }
    description2 { 'あああ' }
    description3 { 'あああ' }
    description4 { 'あああ' }
    description5 { 'あああ' }
    association :user
  end
end
