json.array!(@klasses) do |klass|
  json.extract! klass, :id, :title
  json.url klass_url(klass, format: :json)

  json.skills klass.skills do |skill|
    json.title skill.title
    json.category skill.skill_category.title
    json.category_id skill.skill_category.id
    json.class klass.title
    json.class_id klass.id
    json.runes skill.runes

    json.url skill_url(skill, format: :json)
  end
end
