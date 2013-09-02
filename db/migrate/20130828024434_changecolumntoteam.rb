class Changecolumntoteam < ActiveRecord::Migration
	def change
		change_column :teams, :code, :string
  end
  def up
  end

  def down
  end
end
