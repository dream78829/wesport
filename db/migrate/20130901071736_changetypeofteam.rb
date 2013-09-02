class Changetypeofteam < ActiveRecord::Migration
	def change
		change_column :teams, :name, :text
  end
  def up
  end

  def down
  end
end
