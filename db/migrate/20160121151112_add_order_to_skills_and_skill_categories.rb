class AddOrderToSkillsAndSkillCategories < ActiveRecord::Migration
  def change
    add_column :skills, :order, :integer
    add_column :skill_categories, :order, :integer
  end
end
