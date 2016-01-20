class Klass < ActiveRecord::Base
  has_many :skills
  has_many :skill_categories
end
