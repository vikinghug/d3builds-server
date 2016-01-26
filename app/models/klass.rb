class Klass < ActiveRecord::Base
  belongs_to :build
  has_many :skill_categories
  has_many :skills
  has_many :runes
  has_many :passive_skills

  def to_param
    "#{id}-#{title}".parameterize
  end
end
