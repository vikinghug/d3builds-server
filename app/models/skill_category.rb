class SkillCategory < ActiveRecord::Base
  belongs_to :klass
  has_many :skills

  def to_param
    "#{id}-#{title}".parameterize
  end
end
