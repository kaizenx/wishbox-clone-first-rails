json.array!(@page_feeds) do |page_feed|
  json.extract! page_feed, :id, :FeedList, :UserId
  json.url page_feed_url(page_feed, format: :json)
end
