class Skill < ActiveRecord::Base
  belongs_to :klass
  belongs_to :skill_category
  has_many :runes

  def to_param
    "#{id}-#{title}".parameterize
  end
end
