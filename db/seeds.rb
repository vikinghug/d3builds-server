require 'yaml'

seeds = begin
  YAML.load(File.open("config/klasses.yml"))
rescue ArgumentError => e
  puts "Could not parse YAML: #{e.message}"
end

seeds['klasses'].each do |klass, klass_skills_categories|
  current_class = Klass.where(title: klass).first_or_create

  klass_skills_categories.each do |skill_category, skills|
    current_skill_category = SkillCategory.where(title: skill_category, klass: current_class).first_or_create

    skills.each do |skill|
      Skill.where(title: skill, klass: current_class, skill_category: current_skill_category).first_or_create
    end
  end
end
