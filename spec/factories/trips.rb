FactoryBot.define do
  factory :trip do
    lat { '59.334' }
    lng { '18.063' }
    destination { 'Stockholm' }
    days { 4 }
  end
end
