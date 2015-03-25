json.array!(@product_in_feeds) do |product_in_feed|
  json.extract! product_in_feed, :id, :productid, :feedid
  json.url product_in_feed_url(product_in_feed, format: :json)
end
