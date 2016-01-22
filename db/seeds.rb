require 'yaml'

seeds = begin
  YAML.load(File.open("config/klasses.yml"))
rescue ArgumentError => e
  puts "Could not parse YAML: #{e.message}"
end

seeds['klasses'].each do |klass, klass_skill_types|
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
