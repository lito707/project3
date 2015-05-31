class LocationController < ApplicationController
  def retrieve_locations
    @locations = Location.all
  end

  
end
