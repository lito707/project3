# Authors
# Dimas Antony Chacon Salas - 659825
# Tou Lee - 656128
# David Monroy - 610346
# Jhon Manuel Portella Delgado - 680794
# ___________________________________________
# controller for location class
class LocationController < ApplicationController
  # retrieve all locations
  def retrieve_locations
    @locations = Location.all
  end
end
