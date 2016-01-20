class AddKlassToSkills < ActiveRecord::Migration
  def change
    add_reference :skills, :klass, index: true
  end
end
