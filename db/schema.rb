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

ActiveRecord::Schema.define(:version => 20130111161955) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "evaluated",           :default => false
  end

  create_table "messages", :force => true do |t|
    t.string   "from"
    t.string   "to"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "news_categories", :force => true do |t|
    t.integer  "news_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "news_categories", ["category_id"], :name => "index_news_categories_on_category_id"
  add_index "news_categories", ["news_id"], :name => "index_news_categories_on_news_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "settings", :force => true do |t|
    t.integer  "league_id"
    t.string   "league_short"
    t.string   "league_saison"
    t.datetime "last_change"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "color_body"
    t.string   "color_input"
    t.string   "color_input_border"
    t.string   "color_input_shadow"
    t.string   "color_input_border_hover"
    t.string   "color_input_shadow_hover"
    t.string   "color_input_border_focus"
    t.string   "color_input_shadow_focus"
    t.string   "color_input_submit"
    t.string   "color_input_submit_background_top"
    t.string   "color_input_submit_background_bottom"
    t.string   "color_input_submit_background_hover"
    t.string   "color_title"
    t.string   "color_main"
    t.string   "color_main_h2"
    t.string   "color_main_h3"
    t.string   "color_notice_background"
    t.string   "color_alert_background"
  end

  create_table "soccerteams", :force => true do |t|
    t.integer  "team_number"
    t.string   "team_name"
    t.string   "team_icon_url"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "played_matches", :default => 0
    t.integer  "win",            :default => 0
    t.integer  "drawn",          :default => 0
    t.integer  "lost",           :default => 0
    t.integer  "goals_for",      :default => 0
    t.integer  "goals_against",  :default => 0
    t.integer  "points",         :default => 0
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.boolean  "is_public"
    t.float    "points",     :default => 0.0
  end

  create_table "tipps", :force => true do |t|
    t.integer  "team1"
    t.integer  "team2"
    t.integer  "points",     :default => -1
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id"
    t.integer  "match_id"
    t.boolean  "checked",    :default => false
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
    t.integer  "team_id"
    t.integer  "points",                 :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
