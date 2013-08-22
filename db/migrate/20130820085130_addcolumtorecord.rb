class Addcolumtorecord < ActiveRecord::Migration
  def change
  	add_column :records ,:starter ,:boolean
  end

  def up
  end

  def down
  end
end
