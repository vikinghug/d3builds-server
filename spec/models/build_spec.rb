require 'rails_helper'

RSpec.describe Build, type: :model do
  describe '#skill_slots' do
    context 'when there is a build' do
      let(:build) { create :build }

      context 'and it has the maximum number of skill slots' do
        before do
          create_list :skill_slot, 6, build: build
          build.reload
        end

        it 'is not valid when trying to assign another' do
          build.skill_slots.build(position: 7)
          expect(build).not_to have_valid(:skill_slots)
        end
      end
    end
  end
end
