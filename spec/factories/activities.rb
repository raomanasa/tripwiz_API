FactoryBot.define do
  factory :activity do
    name { "Museum" }
    address { "Stockholmsgatan 1, Stockholm" }
    rating { "4.2" }
    lat { "59.32#{rand(100)}" }
    lng { "18.06#{rand(100)}" }
    association :activity_type
  end
end