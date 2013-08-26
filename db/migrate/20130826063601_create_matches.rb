class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :team_id
      t.integer :player_id
      t.integer :status
      t.integer :type

      t.timestamps
    end
  end
end
