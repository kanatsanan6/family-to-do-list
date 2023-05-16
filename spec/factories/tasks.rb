# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { 'walk a dog' }
    member { create(:member) }
  end
end
