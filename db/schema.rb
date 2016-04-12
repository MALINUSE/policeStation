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

ActiveRecord::Schema.define(version: 20160412231112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cercles", force: :cascade do |t|
    t.integer  "region_id"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cercles", ["region_id"], name: "index_cercles_on_region_id", using: :btree

  create_table "communes", force: :cascade do |t|
    t.integer  "cercle_id"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "communes", ["cercle_id"], name: "index_communes_on_cercle_id", using: :btree

  create_table "declarations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "quartier_id"
    t.integer  "engin_id"
    t.string   "color"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "declarations", ["engin_id"], name: "index_declarations_on_engin_id", using: :btree
  add_index "declarations", ["quartier_id"], name: "index_declarations_on_quartier_id", using: :btree
  add_index "declarations", ["user_id"], name: "index_declarations_on_user_id", using: :btree

  create_table "engins", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "quartiers", force: :cascade do |t|
    t.integer  "commune_id"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "quartiers", ["commune_id"], name: "index_quartiers_on_commune_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "station_polices", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "commune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "station_polices", ["commune_id"], name: "index_station_polices_on_commune_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username"
    t.string   "nom"
    t.string   "prenom"
    t.string   "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_founds", force: :cascade do |t|
    t.integer  "station_police_id"
    t.integer  "engin_id"
    t.string   "color"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "vehicle_founds", ["engin_id"], name: "index_vehicle_founds_on_engin_id", using: :btree
  add_index "vehicle_founds", ["station_police_id"], name: "index_vehicle_founds_on_station_police_id", using: :btree

  add_foreign_key "cercles", "regions"
  add_foreign_key "communes", "cercles"
  add_foreign_key "declarations", "engins"
  add_foreign_key "declarations", "quartiers"
  add_foreign_key "declarations", "users"
  add_foreign_key "quartiers", "communes"
  add_foreign_key "station_polices", "communes"
  add_foreign_key "vehicle_founds", "engins"
  add_foreign_key "vehicle_founds", "station_polices"
end
