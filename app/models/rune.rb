class Rune < ActiveRecord::Base
  belongs_to :klass
  belongs_to :skill
  belongs_to :skill_category
end
