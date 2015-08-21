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

ActiveRecord::Schema.define(version: 20150820075200) do

  create_table "admins", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "survey_id",   limit: 4
    t.integer  "point",       limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "answers", ["point"], name: "index_answers_on_point", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["survey_id"], name: "index_answers_on_survey_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "districts", ["city_id"], name: "index_districts_on_city_id", using: :btree

  create_table "evaluations", force: :cascade do |t|
    t.integer  "term_id",        limit: 4
    t.integer  "session_number", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "evaluations", ["term_id"], name: "index_evaluations_on_term_id", using: :btree

  create_table "question_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "question_type_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "evaluation_id",    limit: 4
  end

  add_index "questions", ["evaluation_id"], name: "index_questions_on_evaluation_id", using: :btree
  add_index "questions", ["question_type_id"], name: "index_questions_on_question_type_id", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "evaluation_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "surveys", ["evaluation_id"], name: "index_surveys_on_evaluation_id", using: :btree
  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id", using: :btree

  create_table "terms", force: :cascade do |t|
    t.integer  "term_number", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "identity",               limit: 255
    t.date     "birthdate"
    t.integer  "district_id",            limit: 4
    t.integer  "role",                   limit: 4
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["district_id"], name: "index_users_on_district_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role"], name: "index_users_on_role", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "surveys"
  add_foreign_key "evaluations", "terms"
  add_foreign_key "questions", "question_types"
  add_foreign_key "surveys", "evaluations"
  add_foreign_key "surveys", "users"
end
