json.array!(@friend_lists) do |friend_list|
  json.extract! friend_list, :id, :UserId, :FriendUserId
  json.url friend_list_url(friend_list, format: :json)
end
