class AddColumnsToTeamUsers < ActiveRecord::Migration
  def change
    add_column :team_users, :provider, :string
    add_column :team_users, :uid, :string
  end
end
