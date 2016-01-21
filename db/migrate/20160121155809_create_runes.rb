class CreateRunes < ActiveRecord::Migration
  def change
    create_table :runes do |t|
      t.string :title
      t.belongs_to :klass
      t.belongs_to :skill
      t.belongs_to :skill_category
      t.integer :order

      t.timestamps null: false
    end
  end
end
