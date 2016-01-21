json.extract! @klass, :id, :title, :created_at, :updated_at
json.skills @klass.skills do |skill|
  json.title skill.title
  json.category skill.skill_category.title
  json.category_id skill.skill_category.id
  json.class @klass.title
  json.class_id @klass.id
  json.url skill_url(skill, format: :json)
end
