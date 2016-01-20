class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :title
      t.string :type

      t.timestamps null: false
    end
  end
end
