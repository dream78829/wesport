class AddColumnToMatch2 < ActiveRecord::Migration
  def change
  	add_column :matches, :user_id,:integer
  end
end
