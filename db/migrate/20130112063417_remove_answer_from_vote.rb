class RemoveAnswerFromVote < ActiveRecord::Migration
  def up
    remove_column :votes, :answer
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
