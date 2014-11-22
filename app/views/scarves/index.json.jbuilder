json.array!(@scarves) do |scarf|
  json.extract! scarf, :id, :name
  json.url scarf_url(scarf, format: :json)
end
