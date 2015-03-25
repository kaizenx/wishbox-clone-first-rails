json.array!(@user_details) do |user_detail|
  json.extract! user_detail, :id, :FirstName, :LastName, :Age, :Email, :UserId, :StreetAddr, :State, :City, :Zipcode, :Country, :Income, :Gender
  json.url user_detail_url(user_detail, format: :json)
end
