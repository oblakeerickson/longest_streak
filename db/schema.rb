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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140219134245) do

  create_table "contributions", force: true do |t|
    t.date     "contributed_on"
    t.integer  "contribution_count"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "github_id"
    t.integer  "longest_streak"
  end

  add_index "users", ["github_id"], name: "index_users_on_github_id", unique: true
  add_index "users", ["longest_streak"], name: "index_users_on_longest_streak"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
