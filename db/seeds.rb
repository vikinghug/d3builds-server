# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
barbarian = Klass.where(title: 'Barbarian').first_or_create
crusader = Klass.where(title: 'Crusader').first_or_create
demon_hunter = Klass.where(title: 'Demon Hunter').first_or_create
monk = Klass.where(title: 'Monk').first_or_create
witch_doctor = Klass.where(title: 'Witch Doctor').first_or_create
wizard = Klass.where(title: 'Wizard').first_or_create

barbarian_skills_categories = {
  primary: SkillCategory.where({title: "Primary", klass: barbarian}).first_or_create,
  secondary: SkillCategory.where({title: "Secondary", klass: barbarian}).first_or_create,
  defensive: SkillCategory.where({title: "Defensive", klass: barbarian}).first_or_create,
  might: SkillCategory.where({title: "Might", klass: barbarian}).first_or_create,
  tactics: SkillCategory.where({title: "Tactics", klass: barbarian}).first_or_create,
  rage: SkillCategory.where({title: "Rage", klass: barbarian}).first_or_create,
}

barbarian_skills = [
  {title: "Bash", klass: barbarian, skill_category: barbarian_skills_categories[:primary]},
  {title: "Cleave", klass: barbarian, skill_category: barbarian_skills_categories[:primary]},
  {title: "Frenzy", klass: barbarian, skill_category: barbarian_skills_categories[:primary]},
  {title: "Weapon Throw", klass: barbarian, skill_category: barbarian_skills_categories[:primary]},

  {title: "Hammer of the Ancients", klass: barbarian, skill_category: barbarian_skills_categories[:secondary]},
  {title: "Rend", klass: barbarian, skill_category: barbarian_skills_categories[:secondary]},
  {title: "Seismic Slam", klass: barbarian, skill_category: barbarian_skills_categories[:secondary]},
  {title: "Whirlwind", klass: barbarian, skill_category: barbarian_skills_categories[:secondary]},
  {title: "Ancient Spear", klass: barbarian, skill_category: barbarian_skills_categories[:secondary]},

  {title: "Ground Stomp", klass: barbarian, skill_category: barbarian_skills_categories[:defensive]},
  {title: "Leap", klass: barbarian, skill_category: barbarian_skills_categories[:defensive]},
  {title: "Sprint", klass: barbarian, skill_category: barbarian_skills_categories[:defensive]},
  {title: "Ignore Pain", klass: barbarian, skill_category: barbarian_skills_categories[:defensive]},

  {title: "Overpower", klass: barbarian, skill_category: barbarian_skills_categories[:might]},
  {title: "Revenge", klass: barbarian, skill_category: barbarian_skills_categories[:might]},
  {title: "Furious Charge", klass: barbarian, skill_category: barbarian_skills_categories[:might]},
  {title: "Avalanche", klass: barbarian, skill_category: barbarian_skills_categories[:might]},

  {title: "Threatening Shout", klass: barbarian, skill_category: barbarian_skills_categories[:tactics]},
  {title: "Battle Rage", klass: barbarian, skill_category: barbarian_skills_categories[:tactics]},
  {title: "War Cry", klass: barbarian, skill_category: barbarian_skills_categories[:tactics]},

  {title: "Earthquake", klass: barbarian, skill_category: barbarian_skills_categories[:rage]},
  {title: "Call of the Ancients", klass: barbarian, skill_category: barbarian_skills_categories[:rage]},
  {title: "Wrath of the Berserker", klass: barbarian, skill_category: barbarian_skills_categories[:rage]},
]

barbarian_skills.each do |skill|
  Skill.where(skill).first_or_create
end
