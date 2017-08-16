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

ActiveRecord::Schema.define(version: 20170811082558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "cdx_pages", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.string "slug", limit: 255, null: false
    t.string "state", limit: 45, null: false
    t.text "content"
    t.date "published_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cdx_sites", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "code", limit: 45, null: false
    t.string "domain", limit: 45, null: false
    t.json "settings"
    t.boolean "default", default: false
  end

  create_table "cdx_taxonomies", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.text "description"
  end

  create_table "cdx_taxons", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.text "description"
    t.bigint "taxonomy_id", null: false
    t.bigint "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.index ["lft"], name: "index_cdx_taxons_on_lft"
    t.index ["parent_id"], name: "index_cdx_taxons_on_parent_id"
    t.index ["rgt"], name: "index_cdx_taxons_on_rgt"
    t.index ["taxonomy_id"], name: "index_cdx_taxons_on_taxonomy_id"
  end

  create_table "cdx_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.hstore "settings"
    t.index ["email"], name: "index_cdx_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_cdx_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cdx_taxons", "cdx_taxonomies", column: "taxonomy_id"
  add_foreign_key "cdx_taxons", "cdx_taxons", column: "parent_id"
end
