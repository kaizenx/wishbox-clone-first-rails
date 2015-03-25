json.array!(@itineraries) do |itinerary|
  json.extract! itinerary, :id, :UserId, :ProductId, :TripId
  json.url itinerary_url(itinerary, format: :json)
end
