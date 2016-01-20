class Skill < ActiveRecord::Base
  belongs_to :klass
  belongs_to :skill_category
end
