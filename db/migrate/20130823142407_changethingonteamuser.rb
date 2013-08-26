class Changethingonteamuser < ActiveRecord::Migration
  def change
  	add_column :team_users, :high,:integer
  	add_column :team_users, :weight,:integer
  	add_column :team_users, :school,:string
  	add_column :team_users, :department,:string
  	rename_column :team_users, :team_contact_phone_number, :phone_number
  	rename_column :team_users, :team_name, :name
  	remove_column :team_users, :account
  	remove_column :team_users, :team_contact_email
  end

  def up
  end

  def down
  end
end
