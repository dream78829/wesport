class AddcolumntogameIii < ActiveRecord::Migration
  def change
  	add_column :games, :note , :string
  	add_column :games, :location, :string
  end

  def up
  end

  def down
  end
end
