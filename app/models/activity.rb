# frozen_string_literal: true

class Activity < ApplicationRecord
  validates_presence_of :name, :address, :rating, :lat, :lng

  belongs_to :activity_type
end
