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

ActiveRecord::Schema.define(version: 20170711035330) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "brand_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "division_id"
    t.string   "division_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "items", primary_key: "item_id", id: :string, limit: 4, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "item_name"
    t.integer  "brand_id"
    t.integer  "unit_id"
    t.boolean  "active"
    t.integer  "category_usage"
    t.integer  "category_item"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["brand_id"], name: "index_items_on_brand_id", using: :btree
    t.index ["unit_id"], name: "index_items_on_unit_id", using: :btree
  end

  create_table "units", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "unit_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "warehouses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "warehouse_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "items", "brands"
  add_foreign_key "items", "units"
end
