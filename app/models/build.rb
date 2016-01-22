class Build < ActiveRecord::Base
  has_many :skill_slots
  has_many :skills, through: :skill_slots
  has_many :runes, through: :skill_slots

  has_many :passive_skills

  def to_param
    "#{id}-#{title}".parameterize
  end
end
