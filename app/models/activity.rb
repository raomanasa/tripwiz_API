# frozen_string_literal: true

class Activity < ApplicationRecord
  validates_presence_of :name, :address, :rating, :lat, :lng

  belongs_to :activity_type

  def self.create_activities(activity_type, number_of_activities, search_keyword)
    activities = []
    radius = 3000

    while radius < 10_000
      response = Activity.get_activities(activity_type, radius, search_keyword)

      if response['results'].length < number_of_activities.to_i
        radius *= 1.5
      else
        sort_by_rating = response['results'].sort_by { |res| res['rating'] }.reverse

        (0..number_of_activities.to_i - 1).each do |i|
          name = sort_by_rating[i]['name']
          rating = sort_by_rating[i]['rating']
          address = sort_by_rating[i]['vicinity']
          lat = sort_by_rating[i]['geometry']['location']['lat']
          lng = sort_by_rating[i]['geometry']['location']['lng']

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
        return activities
      end
    end
  end

  private

  def self.get_activities(activity_type, radius, search_keyword)
    lat = activity_type.trip.lat
    lng = activity_type.trip.lng
    max_price = activity_type.max_price if activity_type.max_price

    params = { location: "#{lat},#{lng}",
               type: activity_type.activity_type,
               radius: radius,
               max_price: max_price,
               keyword: search_keyword,
               key: Rails.application.credentials.google_api_token }

    url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
    response = JSON.parse RestClient.get url, params: params.compact
  end
end
