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

ActiveRecord::Schema.define(version: 20140828142354) do

  create_table "todos", force: true do |t|
    t.integer  "user_id",                      null: false
    t.string   "title"
    t.boolean  "is_completed", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "todos", ["user_id"], name: "index_todos_on_user_id", using: :btree

  create_table "tokens", force: true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "expiresAt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokens", ["token"], name: "index_tokens_on_token", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
