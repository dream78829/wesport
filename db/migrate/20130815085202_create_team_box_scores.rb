class CreateTeamBoxScores < ActiveRecord::Migration
  def change
    create_table :team_box_scores do |t|

      t.timestamps
    end
  end
end
