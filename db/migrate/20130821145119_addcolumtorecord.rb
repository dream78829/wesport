class Addcolumtorecord < ActiveRecord::Migration
  def change
  	add_column :records ,:starter ,:boolean
  end
end
