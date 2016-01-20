json.array!(@skills) do |skill|
  json.extract! skill, :id, :title, :type
  json.url skill_url(skill, format: :json)
end
