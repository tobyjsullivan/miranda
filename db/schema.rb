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

ActiveRecord::Schema.define(version: 2019_05_13_131815) do

  create_table "boards", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_boards_on_slug", unique: true
  end

  create_table "boards_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "board_id", null: false
    t.index ["user_id"], name: "index_boards_users_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.string "token"
    t.integer "board_id"
    t.integer "user_id"
    t.integer "inviter_id"
    t.datetime "expires"
    t.datetime "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_invitations_on_board_id"
    t.index ["inviter_id"], name: "index_invitations_on_inviter_id"
    t.index ["token"], name: "index_invitations_on_token"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_posts_on_board_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
