class Build < ActiveRecord::Base
  belongs_to :klass
  has_many :skill_slots
  has_many :skills, through: :skill_slots
  has_many :runes, through: :skill_slots

  has_many :passive_slots
  has_many :passive_skills, through: :passive_slots

  def to_param
    "#{id}-#{title}".parameterize
  end
end
