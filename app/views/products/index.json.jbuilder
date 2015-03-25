json.array!(@products) do |product|
  json.extract! product, :id, :Title, :SubTitle, :ImageURL, :TargetURL, :Wants, :CreatedByUserId, :Currency, :Price, :IsPublished, :MerchantId, :SKUId, :Category, :StartDate, :EndDate, :DestinationId, :Description, :Highlights, :Condition, :BasePrice, :DiscountPercentage, :slug
  json.url product_url(product, format: :json)
end
