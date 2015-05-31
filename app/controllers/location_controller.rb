class LocationController < ApplicationController
  before_action :set_weather, only: [:show, :update]

  def index
    @locations = Location.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @weather = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:long, :lat, :location_id)
    end
end
