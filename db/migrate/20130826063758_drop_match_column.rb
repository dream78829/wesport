class DropMatchColumn < ActiveRecord::Migration
  def up
  	remove_column :matches, :type
  end

  def down
  end
end
