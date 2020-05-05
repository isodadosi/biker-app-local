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

ActiveRecord::Schema.define(version: 2020_03_18_083310) do

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "content_id"
    t.string "name", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_comments_on_content_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.string "place"
    t.text "body", limit: 65535
    t.string "image"
    t.string "prefecture"
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sceneries", force: :cascade do |t|
    t.string "name"
    t.string "title", null: false
    t.text "body"
    t.string "image"
    t.string "place"
    t.string "prefecture"
    t.float "latitude"
    t.float "longitude"
    t.string "parking_select"
    t.text "parking_description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_category_relations", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_shop_category_relations_on_category_id"
    t.index ["shop_id"], name: "index_shop_category_relations_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "body"
    t.string "image"
    t.string "prefecture"
    t.string "place"
    t.float "latitude"
    t.float "longitude"
    t.integer "parking_rank"
    t.string "parking_select"
    t.text "parking_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

end
