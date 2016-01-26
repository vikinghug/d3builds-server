class Build < ActiveRecord::Base
  SKILL_SLOT_LIMIT = 6

  belongs_to :klass
  has_many :skill_slots
  has_many :skills, through: :skill_slots
  has_many :runes, through: :skill_slots

  has_many :passive_slots
  has_many :passive_skills, through: :passive_slots

  validate :limit_number_of_skill_slots

  def limit_number_of_skill_slots
    if skill_slots.length > SKILL_SLOT_LIMIT
      errors.add(:skill_slots, "can't have more than #{SKILL_SLOT_LIMIT}")
    end
  end

  def to_param
    "#{id}-#{title}".parameterize
  end
end
