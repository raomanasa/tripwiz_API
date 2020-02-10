# frozen_string_literal: true

class Api::V1::ActivityTypesController < ApplicationController
  def create
    activity_type = create_activity_type 
    activity_visits = set_activity_visits
    search_keyword = params[:keyword]

    activities = ActivityCreator.new(activity_type, activity_visits, search_keyword).as_json['activities']

    if activities && activities.length == activity_visits.to_i
      render json: activities, status: 200
    else
      activity_type.destroy
      render json: { error: 'Failed to create activity.' }, status: 422
    end
  end

  private

  def set_activity_visits
    if params[:activity_type] == 'restaurant'
      Trip.find(params[:trip]).days
    else
      params[:activity_visits]
    end
  end

  def create_activity_type
    activity_type = ActivityType.create(activity_type: params.require(:activity_type),
                        trip_id: params.require(:trip),
                        max_price: params[:max_price])
                        
    if activity_type.persisted?
      activity_type
    else
      render json: { error: activity_type.errors.full_messages }, status: 422
    end
  end
end
