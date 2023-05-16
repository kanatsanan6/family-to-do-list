# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    sequence(:name) { |n| "member #{n}" }
    tasks_count { 1 }
  end
end
