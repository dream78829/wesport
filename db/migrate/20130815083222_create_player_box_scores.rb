class CreatePlayerBoxScores < ActiveRecord::Migration
  def change
    create_table :player_box_scores do |t|

      t.timestamps
    end
  end
end
