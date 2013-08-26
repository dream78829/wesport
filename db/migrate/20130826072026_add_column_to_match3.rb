class AddColumnToMatch3 < ActiveRecord::Migration
  def change
  	add_column :matches, :team,:integer
  end
end
