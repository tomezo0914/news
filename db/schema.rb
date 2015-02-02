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

ActiveRecord::Schema.define(version: 20150202072740) do

  create_table "authors", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,             null: false
    t.integer  "status",     limit: 4, default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "title",      limit: 65535,             null: false
    t.text     "content",    limit: 65535,             null: false
    t.integer  "author_id",  limit: 4,                 null: false
    t.integer  "status",     limit: 4,     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "term_relationships", force: :cascade do |t|
    t.integer  "post_id",          limit: 4,             null: false
    t.integer  "term_taxonomy_id", limit: 4,             null: false
    t.integer  "term_order",       limit: 4, default: 0, null: false
    t.integer  "status",           limit: 4, default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "status",     limit: 4, default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end