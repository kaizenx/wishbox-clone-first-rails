json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :name, :feeid, :productid, :image
  json.url gallery_url(gallery, format: :json)
end
