RSpec.describe 'POST /api/v1/activity_type', type: :request do
  let(:trip) { create(:trip) }

  describe 'Successfully creates activity type' do
    before do
      get_google_places_museums_success
      
      post "/api/v1/activity_types",
          params: { activity_type: "museum",
                    actTimes: 3,
                    trip: trip.id
                   }

    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns 3 activities' do
      expect(response_json.length).to eq 3
    end
  end

  describe 'Successfully creates restaurants' do
    before do
      get_google_places_restaurants_success
      
      post "/api/v1/activity_types",
          params: { activity_type: "restaurant",
                    keyword: "chinese",
                    trip: trip.id,
                    max_price: "2"
                   }

    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns 4 restaurants' do
      expect(response_json.length).to eq 4
    end
  end

  describe 'Unsuccesfully when no params' do
    before do
      post "/api/v1/activity_types"
    end

    it 'returns a 422 response status' do
      expect(response).to have_http_status 422
    end

    it 'returns error message' do
      expect(response_json["error"]).to eq "Missing parameters"
    end
  end

  describe 'Unsuccesfully when not finding enough activities in radius' do
    before do
      get_google_places_museums_success

      post "/api/v1/activity_types",
          params: { activity_type: "museum",
                    trip: trip.id,
                    actTimes: 4
                   }
    end

    it 'returns a 422 response status' do
      expect(response).to have_http_status 422
    end

    it 'returns error message' do
      expect(response_json["error"]).to eq "Failed to create activity."
    end
  end
end