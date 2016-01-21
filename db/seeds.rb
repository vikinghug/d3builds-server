require 'yaml'

seeds = begin
  YAML.load(File.open("config/klasses.yml"))
rescue ArgumentError => e
  puts "Could not parse YAML: #{e.message}"
end

seeds['klasses'].each do |klass, klass_skills_categories|
  current_class = Klass.where(title: klass).first_or_create

  skill_category_index = 0
  klass_skills_categories.each do |skill_category, skills|
    current_skill_category = SkillCategory.where(
      title: skill_category,
      klass: current_class,
      order: skill_category_index
    ).first_or_create

    skill_index = 0
    skills.each do |skill, runes|
      Skill.where(
        title: skill,
        klass: current_class,
        skill_category: current_skill_category,
        order: skill_index
      ).first_or_create

      skill_index += 1
    end

    skill_category_index += 1
  end
end
