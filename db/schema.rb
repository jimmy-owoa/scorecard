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

ActiveRecord::Schema[7.1].define(version: 2023_12_21_220008) do
  create_table "games", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date"
    t.boolean "is_nine_holes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "hole_number"
    t.integer "par"
    t.integer "handicap"
    t.integer "yardage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "player_id", null: false
    t.bigint "hole_id", null: false
    t.integer "strokes"
    t.integer "net"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_scores_on_game_id"
    t.index ["hole_id"], name: "index_scores_on_hole_id"
    t.index ["player_id"], name: "index_scores_on_player_id"
  end

  add_foreign_key "scores", "games"
  add_foreign_key "scores", "holes"
  add_foreign_key "scores", "players"
end
