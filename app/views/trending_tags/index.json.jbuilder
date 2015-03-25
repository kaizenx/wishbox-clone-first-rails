json.array!(@trending_tags) do |trending_tag|
  json.extract! trending_tag, :id, :Tags
  json.url trending_tag_url(trending_tag, format: :json)
end
