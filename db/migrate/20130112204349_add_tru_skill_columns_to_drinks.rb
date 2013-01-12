class AddTruSkillColumnsToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :drinkable_mean, :float
    add_column :drinks, :drinkable_deviation, :float
    add_column :drinks, :presentation_mean, :float
    add_column :drinks, :presentation_deviation, :float
    add_column :drinks, :adventure_mean, :float
    add_column :drinks, :adventure_deviation, :float
  end
end
