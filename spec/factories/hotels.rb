FactoryBot.define do
  factory :hotel do
    name { "Grand Hotel Stockholm" }
    lat { 59.32956 }
    lng { 18.07564 }
    price { "2900.00" }
    address { "SODRA BLASIEHOLMSHAMNEN 8" }
    url { "MyString" }
    association :trip
  end
end
