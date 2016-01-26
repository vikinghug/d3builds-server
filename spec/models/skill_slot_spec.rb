require 'rails_helper'

RSpec.describe SkillSlot, type: :model do
  describe '#build' do
    let(:build) { create :build }
    let(:skill_slot) { FactoryGirl.build :skill_slot, build: build }

    context 'when there are less than 6 skill_slots' do
      before do
        create_list :skill_slot, 5, build: build
      end

      it 'is valid' do
        expect(skill_slot).to have_valid(:build_id)
      end
    end

    context 'when there are exactly 6 skill_slots' do
      before do
        create_list :skill_slot, 6, build: build
      end

      it 'is not valid' do
        expect(skill_slot).not_to have_valid(:build_id)
      end
    end

    context 'when there are more than 6 skill_slots' do
      before do
        6.times do
          FactoryGirl
            .build(:skill_slot, build: build)
            .save!(validate: false)
        end
      end

      it 'is not valid' do
        expect(skill_slot).not_to have_valid(:build_id)
      end
    end
  end
end
