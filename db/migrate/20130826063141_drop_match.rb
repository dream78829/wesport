class DropMatch < ActiveRecord::Migration
  def up
  	drop_table :matches
  end

  def down
  	create_table :matches do |t|
      t.integer :player_id
      t.integer :user_id
      t.integer :status
      t.integer :type

      t.timestamps
    end
  end
end
