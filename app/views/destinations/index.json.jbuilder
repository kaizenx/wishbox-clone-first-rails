json.array!(@destinations) do |destination|
  json.extract! destination, :id, :FeedId, :Name
  json.url destination_url(destination, format: :json)
end
