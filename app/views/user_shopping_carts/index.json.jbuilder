json.array!(@user_shopping_carts) do |user_shopping_cart|
  json.extract! user_shopping_cart, :id, :userid, :productid, :isshow, :IsBought, :Title, :Price, :VoucherCode
  json.url user_shopping_cart_url(user_shopping_cart, format: :json)
end
