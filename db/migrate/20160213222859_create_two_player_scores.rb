class CreateTwoPlayerScores < ActiveRecord::Migration
  def change
    create_table :two_player_scores do |t|
      t.integer :player_1
      t.integer :player_2

      t.timestamps null: false
    end
  end
end
