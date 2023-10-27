# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_12_162532) do
  create_table "furnitures", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "variation", limit: 50
    t.string "pattern", limit: 50
    t.integer "price"
    t.boolean "diy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "home_furnitures", force: :cascade do |t|
    t.integer "player_home_id", null: false
    t.integer "furniture_id", null: false
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["furniture_id"], name: "index_home_furnitures_on_furniture_id"
    t.index ["player_home_id"], name: "index_home_furnitures_on_player_home_id"
  end

  create_table "player_homes", force: :cascade do |t|
    t.integer "player_id", null: false
    t.string "size", limit: 10
    t.integer "home_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_player_homes_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "username", limit: 50
    t.string "gender", limit: 10
    t.string "email", limit: 50
    t.date "birthday"
    t.integer "bells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "home_furnitures", "furnitures"
  add_foreign_key "home_furnitures", "player_homes"
  add_foreign_key "player_homes", "players"
end
