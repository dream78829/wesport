class CreateUserTeamMatches < ActiveRecord::Migration
  def change
    create_table :user_team_matches do |t|

      t.timestamps
    end
  end
end
