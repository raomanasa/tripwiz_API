class ActivityType < ApplicationRecord
  validates_presence_of :activity_type
  
  belongs_to :trip
  has_many :activities, dependent: :destroy 
end
