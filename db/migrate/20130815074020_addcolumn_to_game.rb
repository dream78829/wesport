class AddcolumnToGame < ActiveRecord::Migration
def change
	add_column :games , :name, :string
end 
  def up
  end

  def down
  end
end
