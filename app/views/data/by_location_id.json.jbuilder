json.array!(@data_array) do |data|
  json.extract! data, :id, :contents
end
