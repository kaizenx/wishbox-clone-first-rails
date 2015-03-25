json.array!(@user_wants) do |user_want|
  json.extract! user_want, :id, :UserId, :ProductId
  json.url user_want_url(user_want, format: :json)
end
