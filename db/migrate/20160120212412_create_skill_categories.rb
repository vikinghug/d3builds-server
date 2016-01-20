class CreateSkillCategories < ActiveRecord::Migration
  def change
    create_table :skill_categories do |t|
      t.string :title
      t.references :klass, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
