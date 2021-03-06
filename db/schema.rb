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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180504023125) do

  create_table "matches", force: :cascade do |t|
    t.string   "match_id"
    t.integer  "duration"
    t.string   "mode"
    t.string   "map"
    t.string   "telemetry_link"
    t.integer  "player_count"
    t.integer  "roster_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "created"
    t.string   "shard"
  end

  create_table "participants", force: :cascade do |t|
    t.integer "dbnos"
    t.integer "assists"
    t.integer "boosts"
    t.integer "damage_dealt"
    t.integer "headshot_kills"
    t.integer "heals"
    t.integer "kill_streaks"
    t.integer "kills"
    t.integer "longest_kill"
    t.integer "revives"
    t.integer "ride_distance"
    t.integer "road_kills"
    t.integer "team_kills"
    t.integer "time_survived"
    t.integer "vehicle_destroys"
    t.integer "walk_distance"
    t.string  "weapons_acquired"
    t.integer "kill_ranking_before"
    t.integer "kill_ranking_gained"
    t.integer "win_ranking_before"
    t.integer "win_ranking_gained"
    t.integer "overall_ranking_gained"
    t.integer "player_id"
    t.integer "match_id"
    t.integer "kill_place"
    t.boolean "winner"
    t.integer "win_place"
    t.string  "death_type"
    t.string  "preferred_weapon"
    t.index ["match_id"], name: "index_participants_on_match_id"
    t.index ["player_id"], name: "index_participants_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "player_id"
    t.string   "name"
    t.string   "shard"
    t.string   "stats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "game_mode"
    t.integer  "assists"
    t.integer  "boosts"
    t.integer  "dbnos"
    t.integer  "daily_kills"
    t.integer  "damage_dealt"
    t.integer  "days"
    t.integer  "headshot_kills"
    t.integer  "heals"
    t.integer  "kill_points"
    t.integer  "kills"
    t.integer  "longest_kill"
    t.integer  "longest_time_survived"
    t.integer  "losses"
    t.integer  "max_kill_streaks"
    t.integer  "most_survival_time"
    t.integer  "revives"
    t.integer  "ride_distance"
    t.integer  "road_kills"
    t.integer  "round_most_kills"
    t.integer  "rounds_played"
    t.integer  "suicides"
    t.integer  "team_kills"
    t.integer  "time_survived"
    t.integer  "top_tens"
    t.integer  "vehicle_destroys"
    t.integer  "walk_distance"
    t.integer  "weapons_acquired"
    t.integer  "weekly_kills"
    t.integer  "win_points"
    t.integer  "wins"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "player_id"
    t.index ["player_id"], name: "index_seasons_on_player_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "updated_at",                             null: false
    t.datetime "created_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.boolean  "admin",                  default: false
    t.string   "pubg_account"
    t.string   "api_token"
    t.string   "playstv_account"
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
