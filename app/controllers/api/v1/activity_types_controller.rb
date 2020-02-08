# frozen_string_literal: true

class Api::V1::ActivityTypesController < ApplicationController
  def create
    number_of_activities = if params[:activity_type] == 'restaurant'
                             Trip.find(params[:trip]).days
                           else
                             params[:actTimes]
                           end
    search_keyword = params[:keyword] ? params[:keyword] : nil

    activity_type = ActivityType.create(activity_type: params.require(:activity_type),
                                        trip_id: params.require(:trip),
                                        max_price: params[:max_price])

    if activity_type.persisted?
      activities = Activity.create_activities(activity_type, number_of_activities, search_keyword)

      if activities && activities.length == number_of_activities.to_i
        render json: activities, status: 200
      else
        activity_type.destroy
        render json: { error: 'Failed to create activity.' }, status: 422
      end
    else
      render json: { error: activity_type.errors.full_messages }, status: 422
    end
  end
end
