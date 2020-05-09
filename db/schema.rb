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

ActiveRecord::Schema.define(version: 2020_05_09_033951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

# Could not dump table "deals" because of following StandardError
#   Unknown type 'player_position' for column 'dealer'

# Could not dump table "hands" because of following StandardError
#   Unknown type 'player_position' for column 'seat'

  create_table "practice_deals", force: :cascade do |t|
    t.bigint "practice_id", null: false
    t.bigint "deal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deal_id"], name: "index_practice_deals_on_deal_id"
    t.index ["practice_id"], name: "index_practice_deals_on_practice_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string "kind"
    t.bigint "user_id", null: false
    t.uuid "uuid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_practices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "practice_deals", "deals"
  add_foreign_key "practice_deals", "practices"
  add_foreign_key "practices", "users"
end
