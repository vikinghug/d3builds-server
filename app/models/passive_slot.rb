class PassiveSlot < ActiveRecord::Base
  belongs_to :build
  belongs_to :passive_skill
end
