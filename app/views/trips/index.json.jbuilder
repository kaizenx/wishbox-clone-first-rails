json.array!(@user_in_feeds) do |user_in_feed|
  json.extract! user_in_feed, :id, :userid, :feedid
  json.url user_in_feed_url(user_in_feed, format: :json)
end
