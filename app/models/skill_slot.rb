class SkillSlot < ActiveRecord::Base
  belongs_to :build
  belongs_to :skill
  belongs_to :rune
end
