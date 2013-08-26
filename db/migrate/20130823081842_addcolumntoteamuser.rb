class Addcolumntoteamuser < ActiveRecord::Migration
 def change 
 	add_column :team_users, :avatar,:string
 	end 

  def up
  end

  def down
  end
end
