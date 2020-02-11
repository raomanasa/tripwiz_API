# frozen_string_literal: true

RSpec.describe 'DELETE /api/v1/hotels', type: :request do
  describe 'Hotel suggestions' do
    let!(:trip) { create(:trip) }
    let!(:other_trip) { create(:trip) }
    3.times do
      let!(:trip_hotels) { create_list(:hotel, 3, trip_id: trip.id) }
      let!(:other_trip_hotels) { create_list(:hotel, 3, trip_id: other_trip.id) }
    end

    it 'that are not chosen are deleted' do
      delete '/api/v1/hotels',
             params: { hotel_id: trip.hotels.first.id,
                       trip: trip.id }

      expect(trip.hotels.length).to eq 1
    end

    it 'that belong to other trips are not deleted' do
      delete '/api/v1/hotels',
             params: { hotel_id: trip.hotels.first.id,
                       trip: trip.id }

      expect(other_trip.hotels.empty?).to eq false
    end
  end
end
