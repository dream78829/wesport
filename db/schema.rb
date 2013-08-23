# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130823144147) do

  create_table "games", :force => true do |t|
    t.integer  "h_team_id"
    t.integer  "g_team_id"
    t.integer  "league_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "name"
    t.integer  "h_team_points"
    t.integer  "g_team_points"
    t.datetime "date_time"
    t.string   "note"
    t.string   "location"
  end

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer  "player_id"
    t.integer  "user_id"
    t.integer  "status"
    t.integer  "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "player_box_scores", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "team_id"
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "records", :force => true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "free_throw_made"
    t.integer  "free_throw_miss"
    t.integer  "free_throw_total"
    t.integer  "two_points_total"
    t.integer  "three_points_made"
    t.integer  "three_points_miss"
    t.integer  "three_points_total"
    t.integer  "assist"
    t.integer  "block"
    t.integer  "turn_over"
    t.integer  "steal"
    t.integer  "defensive_rebound"
    t.integer  "offensive_rebound"
    t.integer  "rebound_total"
    t.integer  "personal_foul"
    t.integer  "points_total"
    t.integer  "efficiency_formula"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "two_points_made"
    t.integer  "two_points_miss"
    t.boolean  "starter"
  end

  create_table "team_box_scores", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "team_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "phone_number"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar"
    t.integer  "high"
    t.integer  "weight"
    t.string   "school"
    t.string   "department"
  end

  add_index "team_users", ["confirmation_token"], :name => "index_team_users_on_confirmation_token", :unique => true
  add_index "team_users", ["email"], :name => "index_team_users_on_email", :unique => true
  add_index "team_users", ["reset_password_token"], :name => "index_team_users_on_reset_password_token", :unique => true

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_team_matches", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "status"
  end

end
