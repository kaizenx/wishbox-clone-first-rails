json.array!(@feeds) do |feed|
  json.extract! feed, :id, :UserId, :IsAdmin, :Title, :Subtitle, :ImageUrl, :IsSponsor, :restricted, :IsPublished, :Description, :slug, :lat, :lng
  json.url feed_url(feed, format: :json)
end
