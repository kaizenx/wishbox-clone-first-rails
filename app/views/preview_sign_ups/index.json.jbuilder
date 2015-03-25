json.array!(@preview_sign_ups) do |preview_sign_up|
  json.extract! preview_sign_up, :id, :EmailAddress
  json.url preview_sign_up_url(preview_sign_up, format: :json)
end
