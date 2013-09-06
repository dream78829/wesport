class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :free_throw_made
      t.integer :free_throw_miss
      t.integer :free_throw_total
      t.integer :two_points_made
      t.integer :two_points_made
      t.integer :two_points_total
      t.integer :three_points_made
      t.integer :three_points_miss
      t.integer :three_points_total
      t.integer :assist
      t.integer :block
      t.integer :turn_over
      t.integer :steal
      t.integer :defensive_rebound
      t.integer :offensive_rebound
      t.integer :rebound_total
      t.integer :personal_foul
      t.integer :points_total
      t.integer :efficiency_formula

      t.timestamps
    end
  end
end
