class CreateSkillSlots < ActiveRecord::Migration
  def change
    create_table :skill_slots do |t|
      t.references :build, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
      t.references :rune, index: true, foreign_key: true
      t.integer :position, null: false

      t.timestamps null: false
    end
  end
end
