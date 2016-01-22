class Klass < ActiveRecord::Base
  has_many :skill_categories
  has_many :skills
  has_many :runes
  has_many :passive_skills

  def to_param
    "#{id}-#{title}".parameterize
  end
end
