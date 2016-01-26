class SkillSlot < ActiveRecord::Base
  SKILL_SLOT_LIMIT = 6
  belongs_to :skill
  belongs_to :rune
  belongs_to :build

  validates :build_id, presence: true

  validate :skill_slot_limit

  def skill_slot_limit
    others = build.skill_slots.where.not(id: id).count
    if others >= SKILL_SLOT_LIMIT
      errors.add(:build_id, "This build already has the maximum number of skill slots: #{SKILL_SLOT_LIMIT}")
    end
  end
end
