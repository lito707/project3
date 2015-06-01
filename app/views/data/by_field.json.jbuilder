json.prettify!

if @title=="by Location"
  if flash[:notice]
    json.warning flash[:notice]
    flash[:notice]=nil
  else

    json.date @date
    json.current_temp @data_array.last.temperature
    json.current_cond @data_array.last.current_condition
    json.measurements (@data_array) do |data|
      json.time data.created_at.strftime("%I:%M:%S %p")
      json.temp data.temperature
      json.precip data.rainfall
      json.wind_direction data.wind_direction
      json.wind_speed data.wind_speed

    end

  end

end

# search data by Postcode
if @title=="by Postcode"

  if flash[:notice]
    json.warning flash[:notice]
    flash[:notice]=nil

  else

    json.date @date
    json.locations (@data_array) do |loc,data|
      json.id loc.location_id
      json.lat loc.lat
      json.lon loc.long
      json.last_update loc.updated_at.strftime("%I:%M%p %d-%m-%Y")
      json.measurements (data) do |d|
        json.time d.created_at.strftime("%I:%M:%S %p")
        json.temp d.temperature
        json.precip d.rainfall
        json.wind_direction d.wind_direction
        json.wind_speed d.wind_speed
      end

    end

  end

end
