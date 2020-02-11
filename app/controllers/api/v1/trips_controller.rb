# frozen_string_literal: true

class Api::V1::TripsController < ApplicationController
  def create
    destination = get_destination(params)
    trip = Trip.create(destination: destination,
                       lat: params[:lat],
                       lng: params[:lng],
                       days: params[:days])



    if trip.persisted?
      render json: trip
    else
      render json: { error: trip.errors.full_messages }, status: 422
    end
  end

  private

  def get_destination(params)
    response = JSON.parse RestClient.get "http://gd.geobytes.com/GetNearbyCities?radius='1500'&Latitude=#{params[:lat]}&Longitude=#{params[:lng]}&limit=1"
    destination = response[0][1]
  end
end
