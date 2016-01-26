class CreatePassiveSlots < ActiveRecord::Migration
  def change
    create_table :passive_slots do |t|
      t.references :build, index: true, foreign_key: true
      t.references :passive_skill, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
