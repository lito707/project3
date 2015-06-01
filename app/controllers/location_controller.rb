class LocationController < ApplicationController
  # retrieve all locations
  def retrieve_locations
    @locations = Location.all
  end
end
