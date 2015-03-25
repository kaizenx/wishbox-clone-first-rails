json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :Name, :Title, :CompanyName, :Address, :Country, :ContactPhone, :MobilePhone, :Email, :Password
  json.url merchant_url(merchant, format: :json)
end
