json.array!(@contact_us) do |contact_u|
  json.extract! contact_u, :id, :FirstName, :LastName, :Email, :Comment
  json.url contact_u_url(contact_u, format: :json)
end
