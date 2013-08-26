class AddColumnToMatch < ActiveRecord::Migration
  def change
  	add_column :matches, :state,:integer
  end
end
