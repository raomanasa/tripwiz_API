# frozen_string_literal: true

RSpec.describe 'DELETE /api/v1/hotels', type: :request do
  describe 'Hotel suggestions' do
    let!(:trip) { create(:trip) }
    3.times do
      let!(:hotel) { create_list(:hotel, 3, trip_id: trip.id) }
    end

    it 'that are not chosen are deleted' do
      delete '/api/v1/hotels',
             params: { hotel_id: trip.hotels.first.id }

      expect(response.status).to eq 200
    end
  end
end
