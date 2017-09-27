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

ActiveRecord::Schema.define(version: 20170926091237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "cdx_assets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.integer "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "cdx_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "asset_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_cdx_attachments_on_asset_id"
  end

  create_table "cdx_pages", force: :cascade do |t|
    t.jsonb "title_translations", default: {}, null: false
    t.jsonb "slug_translations", default: {}, null: false
    t.string "state", limit: 45, null: false
    t.jsonb "content_translations", default: {}, null: false
    t.date "published_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "taxon_id"
    t.index ["taxon_id"], name: "index_cdx_pages_on_taxon_id"
  end

  create_table "cdx_settings", force: :cascade do |t|
    t.string "acronym", null: false
    t.string "default_theme", null: false
    t.string "default_locale", null: false
    t.string "available_locales", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cdx_sites", force: :cascade do |t|
    t.jsonb "name_translations", default: {}, null: false
    t.string "code", limit: 45, null: false
    t.string "domain", limit: 45, null: false
    t.json "settings"
    t.boolean "default", default: false
  end

  create_table "cdx_taxon_objects", force: :cascade do |t|
    t.bigint "taxon_id"
    t.string "object_type"
    t.bigint "object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["object_type", "object_id"], name: "index_cdx_taxon_objects_on_object_type_and_object_id"
    t.index ["taxon_id"], name: "index_cdx_taxon_objects_on_taxon_id"
  end

  create_table "cdx_taxonomies", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.jsonb "available_codes"
    t.text "description"
  end

  create_table "cdx_taxons", force: :cascade do |t|
    t.text "name", null: false
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
    t.string "roles", default: [], array: true
    t.index ["email"], name: "index_cdx_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_cdx_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cdx_pages", "cdx_taxons", column: "taxon_id"
  add_foreign_key "cdx_taxon_objects", "cdx_taxons", column: "taxon_id"
  add_foreign_key "cdx_taxons", "cdx_taxonomies", column: "taxonomy_id"
  add_foreign_key "cdx_taxons", "cdx_taxons", column: "parent_id"
end
