class Activity < ApplicationRecord
  validates_presence_of :name, :address, :rating, :lat, :lng

  belongs_to :activity_type

  def self.create_activities(activity_type, number_of_activities)
    activities = []
    response = Activity.get_activities(activity_type)

    if response['results'].length >= number_of_activities.to_i

      (0..number_of_activities.to_i - 1).each do |i|
        name = response['results'][i]['name']
        rating = response['results'][i]['rating']
        address = response['results'][i]['vicinity']
        lat = response['results'][i]['geometry']['location']['lat']
        lng = response['results'][i]['geometry']['location']['lng']

        activity = Activity.create(
          name: name,
          address: address,
          rating: rating,
          lat: lat,
          lng: lng,
          activity_type_id: activity_type.id
        )

        activities << activity if activity.persisted?
      end
      activities
    end
  end

  private

  def self.get_activities(activity_type)
    radius = 5000
    lat = activity_type.trip.lat
    lng = activity_type.trip.lng

    url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
    response = JSON.parse RestClient.get url,
                                         params: { location: "#{lat},#{lng}",
                                                   type: activity_type.activity_type,
                                                   radius: radius,
                                                   key: Rails.application.credentials.google_api_token }
  end
end
