class Build < ActiveRecord::Base
  SKILL_SLOT_LIMIT = 6

  has_many :skill_slots
  has_many :skills, through: :skill_slots
  has_many :runes, through: :skill_slots

  has_many :passive_skills

  validates :title, presence: true

  def to_param
    "#{id}-#{title}".parameterize
  end
end
