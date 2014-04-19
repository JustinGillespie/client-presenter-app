json.array!(@groups) do |group|
  json.extract! group, :id, :title, :project_id
  json.url group_url(group, format: :json)
end
