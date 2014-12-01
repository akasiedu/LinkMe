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

ActiveRecord::Schema.define(version: 20141128092607) do

  create_table "applies", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone_number"
    t.string   "level_of_education"
    t.string   "specialty"
    t.string   "resume"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "job_id"
  end

  add_index "applies", ["company_id"], name: "index_applies_on_company_id"
  add_index "applies", ["job_id"], name: "index_applies_on_job_id"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "business"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true

  create_table "jobs", force: true do |t|
    t.string   "company_name"
    t.string   "company_logo"
    t.text     "job_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id"

end
