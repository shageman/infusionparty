class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :drink1
      t.references :drink2
      t.references :category
      t.integer :answer

      t.timestamps
    end
    add_index :votes, :drink1_id
    add_index :votes, :drink2_id
    add_index :votes, :category_id
  end
end
