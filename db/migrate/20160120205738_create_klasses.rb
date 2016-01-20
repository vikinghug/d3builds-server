class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
