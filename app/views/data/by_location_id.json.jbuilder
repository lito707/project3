json.array!(@data_array) do |data|
  json.extract! data, :data.temperature
end
