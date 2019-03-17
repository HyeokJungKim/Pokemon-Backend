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

ActiveRecord::Schema.define(version: 2019_03_17_191410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "evolution_id"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "trainer_id"
    t.bigint "item_id"
    t.integer "quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_inventories_on_item_id"
    t.index ["trainer_id"], name: "index_inventories_on_trainer_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokeballs", force: :cascade do |t|
    t.integer "level"
    t.integer "experience", default: 0
    t.bigint "trainer_id"
    t.bigint "pokemon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.boolean "onTeam", default: false
    t.index ["pokemon_id"], name: "index_pokeballs_on_pokemon_id"
    t.index ["trainer_id"], name: "index_pokeballs_on_trainer_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "type_1"
    t.string "type_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inventories", "items"
  add_foreign_key "inventories", "trainers"
  add_foreign_key "pokeballs", "pokemons"
  add_foreign_key "pokeballs", "trainers"
end
