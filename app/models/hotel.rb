class Hotel < ApplicationRecord
  validates_presence_of :name, :address, :lat, :lng, :price

  belongs_to :trip
end
