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

ActiveRecord::Schema.define(version: 20151202203755) do

  create_table "alarms", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "note",         limit: 65535
    t.decimal  "latitude",                   precision: 15, scale: 10
    t.decimal  "longitude",                  precision: 15, scale: 10
    t.integer  "user_id",      limit: 4
    t.text     "address",      limit: 65535
    t.decimal  "radius",                     precision: 15, scale: 10
    t.boolean  "status",       limit: 1,                               default: false
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
    t.text     "notify_users", limit: 65535
  end

  create_table "rails_push_notifications_apns_apps", force: :cascade do |t|
    t.text     "apns_dev_cert",  limit: 65535
    t.text     "apns_prod_cert", limit: 65535
    t.boolean  "sandbox_mode",   limit: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "rails_push_notifications_gcm_apps", force: :cascade do |t|
    t.string   "gcm_key",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rails_push_notifications_mpns_apps", force: :cascade do |t|
    t.text     "cert",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "rails_push_notifications_notifications", force: :cascade do |t|
    t.text     "destinations", limit: 65535
    t.integer  "app_id",       limit: 4
    t.string   "app_type",     limit: 255
    t.text     "data",         limit: 65535
    t.text     "results",      limit: 65535
    t.integer  "success",      limit: 4
    t.integer  "failed",       limit: 4
    t.boolean  "sent",         limit: 1,     default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "rails_push_notifications_notifications", ["app_id", "app_type", "sent"], name: "app_and_sent_index_on_rails_push_notifications", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "apns_token", limit: 65535
    t.text     "gcm_token",  limit: 65535
    t.string   "fbid",       limit: 255
  end

end
