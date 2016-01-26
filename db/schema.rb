# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160123041506) do

  create_table "builds", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "klass_id"
  end

  add_index "builds", ["klass_id"], name: "index_builds_on_klass_id"

  create_table "klasses", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passive_skills", force: :cascade do |t|
    t.string   "title"
    t.integer  "klass_id"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "passive_skills", ["klass_id"], name: "index_passive_skills_on_klass_id"

  create_table "passive_slots", force: :cascade do |t|
    t.integer  "build_id"
    t.integer  "passive_skill_id"
    t.integer  "position"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "passive_slots", ["build_id"], name: "index_passive_slots_on_build_id"
  add_index "passive_slots", ["passive_skill_id"], name: "index_passive_slots_on_passive_skill_id"

  create_table "runes", force: :cascade do |t|
    t.string   "title"
    t.integer  "klass_id"
    t.integer  "skill_id"
    t.integer  "skill_category_id"
    t.integer  "order"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "runes", ["klass_id"], name: "index_runes_on_klass_id"
  add_index "runes", ["skill_category_id"], name: "index_runes_on_skill_category_id"
  add_index "runes", ["skill_id"], name: "index_runes_on_skill_id"

  create_table "skill_categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "klass_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order"
  end

  add_index "skill_categories", ["klass_id"], name: "index_skill_categories_on_klass_id"

  create_table "skill_slots", force: :cascade do |t|
    t.integer  "build_id"
    t.integer  "skill_id"
    t.integer  "rune_id"
    t.integer  "position",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skill_slots", ["build_id"], name: "index_skill_slots_on_build_id"
  add_index "skill_slots", ["rune_id"], name: "index_skill_slots_on_rune_id"
  add_index "skill_slots", ["skill_id"], name: "index_skill_slots_on_skill_id"

  create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.string   "type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "klass_id"
    t.integer  "skill_category_id"
    t.integer  "order"
  end

  add_index "skills", ["klass_id"], name: "index_skills_on_klass_id"
  add_index "skills", ["skill_category_id"], name: "index_skills_on_skill_category_id"

end
