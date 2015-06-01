json.prettify!

if @title=="by Location"
  if flash[:notice]
    json.warning flash[:notice]
    flash[:notice]=nil
  else
    json.date @date
    json.current_temp @data_array.last.temperature.to_s
    json.current_cond @data_array.last.current_condition
    json.measurements (@data_array) do |data|
      json.time data.created_at.strftime("%I:%M:%S %p")
      json.temp data.temperature.to_s
      json.precip data.rainfall.to_s + "mm"
      json.wind_direction data.wind_direction.to_s + "°"
      json.wind_speed data.wind_speed.to_s
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
      json.lat loc.lat.to_s
      json.lon loc.long.to_s
      json.last_update loc.updated_at.strftime("%I:%M%p %d-%m-%Y")
      json.measurements (data) do |d|
        json.time d.created_at.strftime("%I:%M:%S %p")
        json.temp d.temperature.to_s
        json.precip d.rainfall.to_s + "mm"
        json.wind_direction d.wind_direction.to_s + "°"
        json.wind_speed d.wind_speed.to_s
      end
    end
  end
end
