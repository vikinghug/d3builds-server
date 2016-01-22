class CreateRunes < ActiveRecord::Migration
  def change
    create_table :runes do |t|
      t.string :title
      t.belongs_to :klass, index: true, foreign_key: true
      t.belongs_to :skill, index: true, foreign_key: true
      t.belongs_to :skill_category, index: true, foreign_key: true
      t.integer :order

      t.timestamps null: false
    end
  end
end
