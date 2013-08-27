class Addcolumntomatch < ActiveRecord::Migration
  def change
  	add_column :matches,:player_id,:integer
  	add_column :matches,:team_id,:integer
  	add_column :matches,:user_id,:integer
  	add_column :matches,:state,:integer
  	add_column :matches,:status,:integer
  end
  def up
  end

  def down
  end
end
