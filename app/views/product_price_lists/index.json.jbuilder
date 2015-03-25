json.array!(@product_price_lists) do |product_price_list|
  json.extract! product_price_list, :id, :Price, :DayOfYear
  json.url product_price_list_url(product_price_list, format: :json)
end
