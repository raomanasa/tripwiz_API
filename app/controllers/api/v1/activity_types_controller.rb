# frozen_string_literal: true

class Api::V1::ActivityTypesController < ApplicationController
  def create
    number_of_activities = params.require(:actTimes)
    activity_type = ActivityType.create(activity_type: params.require(:activity_type),
                                        trip_id: params.require(:trip))

    if activity_type.persisted?
      activities = Activity.create_activities(activity_type, number_of_activities)
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
