class Skill < ActiveRecord::Base
  belongs_to :klass
  belongs_to :skill_category
  has_many :runes
end
