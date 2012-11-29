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

ActiveRecord::Schema.define(:version => 20121129114931) do

  create_table "matches", :force => true do |t|
    t.integer  "match_number"
    t.datetime "match_date_time"
    t.string   "time_zone_id"
    t.datetime "match_date_time_utc"
    t.integer  "group_id"
    t.integer  "group_order_id"
    t.string   "group_name"
    t.integer  "league_id"
    t.string   "league_saison"
    t.string   "league_name"
    t.string   "league_shortcut"
    t.string   "name_team1"
    t.string   "name_team2"
    t.integer  "id_team1"
    t.integer  "id_team2"
    t.string   "icon_url_team1"
    t.string   "icon_url_team2"
    t.integer  "points_team1"
    t.integer  "points_team2"
    t.datetime "last_update"
    t.boolean  "match_is_finished"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "from"
    t.string   "to"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "soccerteams", :force => true do |t|
    t.integer  "team_number"
    t.string   "team_name"
    t.string   "team_icon_url"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "user_messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_messages", ["message_id"], :name => "index_user_messages_on_message_id"
  add_index "user_messages", ["user_id"], :name => "index_user_messages_on_user_id"

  create_table "users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthday"
    t.integer  "role_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
