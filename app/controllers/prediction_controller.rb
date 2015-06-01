# Authors
# Dimas Antony Chacon Salas - 659825
# Tou Lee - 656128
# David Monroy - 610346
# Jhon Manuel Portella Delgado - 680794
# ___________________________________________
# controller for prediction class
class PredictionController < ApplicationController
  # predict for a specific latitude and longitude
  def by_lat_long
    @lat = params[:lat].to_f
    @long = params[:long].to_f
    @period = params[:period].to_i
    @predictions, @probabilities =
                    Prediction.new.predict_by_coordinates(@lat, @long, @period)
  end

  # predict for the locations belonging to a postcode
  def by_postcode
    code = params[:post_code].to_i
    # amount of periods to make a prediction
    @period = params[:period].to_i
    if Postcode.all.find_by(code_id: code) == nil
      flash[:notice] = 'Postcode not available'
    else
      @postcode = Postcode.all.find_by(code_id: code)
      @all_data = []
      @postcode.locations.each do |location|
        @all_data << [location].concat(Prediction.new.predict_by_coordinates(location.lat, location.long, @period))
      end
    end
  end

end
