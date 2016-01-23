class CreatePassiveSkills < ActiveRecord::Migration
  def change
    create_table :passive_skills do |t|
      t.string :title
      t.belongs_to :klass, index: true, foreign_key: true
      t.integer :order

      t.timestamps null: false
    end
  end
end
