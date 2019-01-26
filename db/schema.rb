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

ActiveRecord::Schema.define(version: 2019_01_26_224228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "evolution_id"
    t.integer "level"
  end

  create_table "pokeballs", force: :cascade do |t|
    t.integer "level"
    t.integer "experience", default: 0
    t.bigint "trainer_id"
    t.bigint "pokemon_id"
    t.integer "team_number"
    t.index ["pokemon_id"], name: "index_pokeballs_on_pokemon_id"
    t.index ["trainer_id"], name: "index_pokeballs_on_trainer_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "pokedex_id"
    t.string "type_1"
    t.string "type_2"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "money"
  end

  add_foreign_key "pokeballs", "pokemons"
  add_foreign_key "pokeballs", "trainers"
end
