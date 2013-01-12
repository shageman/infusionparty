class MakeCategoriesColumnsOnVote < ActiveRecord::Migration
  def up
    drop_table :categories
    add_column :votes, :best_presentation, :integer
    add_column :votes, :most_adventurous, :integer
    add_column :votes, :most_drinkable, :integer
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
