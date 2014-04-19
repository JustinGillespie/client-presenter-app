json.array!(@assets) do |asset|
  json.extract! asset, :id, :title, :group_id
  json.url asset_url(asset, format: :json)
end
