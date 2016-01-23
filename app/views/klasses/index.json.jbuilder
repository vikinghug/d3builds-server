json.array!(@klasses) do |klass|
  json.extract! klass, :id, :title

  json.active_skills klass.skill_categories do |skill_category|
    json.title skill_category.title
    json.id skill_category.id
    json.class klass.title
    json.class_id klass.id

    json.skills skill_category.skills do |skill|
      json.order skill.order
      json.id skill.id
      json.title skill.title
      json.skill_category skill.skill_category.title
      json.class klass.title
      json.class_id klass.id

      json.runes skill.runes do |rune|
        json.order rune.order
        json.id rune.id
        json.title rune.title
        json.skill_id skill.id
        json.class klass.title
        json.class_id klass.id
        json.updated_at skill.updated_at
        json.created_at skill.created_at
      end

      json.updated_at skill.updated_at
      json.created_at skill.created_at

      json.url skill_url(skill, format: :json)
    end

    json.updated_at skill_category.updated_at
    json.created_at skill_category.created_at
  end


  json.passive_skills klass.passive_skills do |skill|
    json.order skill.order
    json.title skill.title
    json.class klass.title
    json.class_id klass.id
    json.updated_at skill.updated_at
    json.created_at skill.created_at

    json.url skill_url(skill, format: :json)
  end


  json.url klass_url(klass, format: :json)end
