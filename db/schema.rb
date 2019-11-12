# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_12_233041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.string "chat_type"
    t.integer "host_id"
    t.string "name"
    t.string "description"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.string "status", default: "sent"
    t.datetime "time_read"
    t.integer "chat_id"
  end

  create_table "user_chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.boolean "alert"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "banned"
    t.index ["chat_id"], name: "index_user_chats_on_chat_id"
    t.index ["user_id"], name: "index_user_chats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "age"
    t.boolean "active", default: true
    t.datetime "last_login", default: "2019-11-12 23:39:38"
    t.integer "cool_points", default: 0
  end

  add_foreign_key "user_chats", "chats"
  add_foreign_key "user_chats", "users"
end
