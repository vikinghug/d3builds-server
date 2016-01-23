require 'yaml'

def load_yaml(filename)
  YAML.load(File.open("config/#{filename}.yml"))
rescue ArgumentError => e
  puts "Could not parse YAML: #{e.message}"
end

yaml = load_yaml('klasses')

yaml['klasses'].each do |klass, klass_skill_types|
  current_class = Klass.where(title: klass).first_or_create

  active_skill_category_index = 0
  klass_skill_types['active_skills'].each do |skill_category, skills|

    current_skill_category = SkillCategory.where(
      title: skill_category,
      klass: current_class,
      order: active_skill_category_index
    ).first_or_create

    skill_index = 0
    skills.each do |skill, runes|
      current_skill = Skill.where(
        title: skill,
        klass: current_class,
        skill_category: current_skill_category,
        order: skill_index
      ).first_or_create

      runes.each_with_index do |rune, rune_index|
        Rune.where(
          title: rune,
          klass: current_class,
          skill: current_skill,
          skill_category: current_skill_category,
            order: rune_index
        ).first_or_create
      end

      skill_index += 1
    end

    active_skill_category_index += 1
  end

  passive_skill_index = 0
  klass_skill_types['passive_skills'].each do |skill|
    PassiveSkill.where(
      title: skill,
      klass: current_class,
      order: passive_skill_index
    ).first_or_create

    passive_skill_index += 1
  end
end

yaml = load_yaml('builds')
yaml['builds'].each do |build|
  current_build = Build.where(
    title: build['title'],
    url: build['url']
  ).first_or_create

  build['active_skills'].each_with_index do |slot, i|
    current_build.skill_slots.where(
      position: i,
      skill: Skill.where(title: slot['skill']).first,
      rune: Rune.where(title: slot['rune']).first,
    ).first_or_create
  end

  # passive_skills = build['passive_skills'].map do |skill|
  #   PassiveSkill.where(title: skill).first
  # end

  # current_build.skill_slots = active_skills
  # current_build.passive_skills = passive_skills
end
