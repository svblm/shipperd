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

ActiveRecord::Schema.define(version: 20140529190803) do

  create_table "assets", force: true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.integer  "state",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "revision",   default: 0
  end

  create_table "comments", force: true do |t|
    t.string   "body"
    t.integer  "revision"
    t.integer  "commenter_id"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "type"
    t.boolean  "read",       default: false
    t.string   "message"
    t.string   "url"
    t.integer  "user_id"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "homepage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  create_table "projects_users", id: false, force: true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.string   "dropbox_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
