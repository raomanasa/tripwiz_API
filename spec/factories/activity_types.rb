FactoryBot.define do
  factory :activity_type do
    activity_type { "museum" }
    association :trip
  end
end