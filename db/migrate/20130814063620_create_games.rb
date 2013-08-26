class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :h_team_id
      t.integer :g_team_id
      t.integer :league_id

      t.timestamps
    end
  end
end
