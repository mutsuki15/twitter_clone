# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_name#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    password { 'password' }
    password_confirmation { 'password' }
    phone_number { '09012345678' }
    date_of_birth { '2000-01-01' }
  end
end