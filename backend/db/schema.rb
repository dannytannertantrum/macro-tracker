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

ActiveRecord::Schema[8.0].define(version: 2025_08_31_125903) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "carbs_per_gram", null: false
    t.decimal "fat_per_gram", null: false
    t.decimal "protein_per_gram", null: false
    t.decimal "single_serving_grams", null: false
    t.string "serving_unit_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.decimal "grams_consumed"
    t.decimal "number_of_servings"
    t.integer "meal_type", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_logs_on_food_id"
  end

  create_table "meal_items", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "food_id", null: false
    t.decimal "grams_consumed"
    t.decimal "number_of_servings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_meal_items_on_food_id"
    t.index ["meal_id"], name: "index_meal_items_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "logs", "foods"
  add_foreign_key "meal_items", "foods"
  add_foreign_key "meal_items", "meals"
end
