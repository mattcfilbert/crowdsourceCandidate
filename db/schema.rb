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

ActiveRecord::Schema.define(version: 20170809133647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "party"
    t.string "img_url"
    t.string "slogan"
    t.text "about"
    t.integer "vote_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "district_id"
    t.bigint "user_id"
    t.index ["district_id"], name: "index_candidates_on_district_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
  end

  create_table "distzips", force: :cascade do |t|
    t.bigint "district_id", null: false
    t.bigint "zipcode_id", null: false
    t.index ["district_id"], name: "index_distzips_on_district_id"
    t.index ["zipcode_id"], name: "index_distzips_on_zipcode_id"
  end

  create_table "hcandidates", force: :cascade do |t|
    t.string "name"
    t.string "party"
    t.string "img_url"
    t.string "slogan"
    t.text "about"
    t.integer "vote_count"
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_hcandidates_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
  end

  create_table "hvotes", force: :cascade do |t|
    t.text "reason"
    t.bigint "hcandidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hcandidate_id"], name: "index_hvotes_on_hcandidate_id"
  end

  create_table "scandidates", force: :cascade do |t|
    t.string "name"
    t.string "party"
    t.string "img_url"
    t.string "slogan"
    t.text "about"
    t.integer "vote_count"
    t.bigint "senate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["senate_id"], name: "index_scandidates_on_senate_id"
  end

  create_table "senates", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
  end

  create_table "svotes", force: :cascade do |t|
    t.text "reason"
    t.bigint "scandidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scandidate_id"], name: "index_svotes_on_scandidate_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.text "reason"
    t.bigint "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_votes_on_candidate_id"
  end

  create_table "zipcodes", force: :cascade do |t|
    t.integer "zip"
    t.bigint "house_id"
    t.bigint "senate_id"
    t.string "school_district"
    t.string "county"
    t.string "city"
    t.index ["house_id"], name: "index_zipcodes_on_house_id"
    t.index ["senate_id"], name: "index_zipcodes_on_senate_id"
  end

  add_foreign_key "candidates", "districts"
  add_foreign_key "candidates", "users"
  add_foreign_key "distzips", "districts"
  add_foreign_key "distzips", "zipcodes"
  add_foreign_key "hcandidates", "houses"
  add_foreign_key "hvotes", "hcandidates"
  add_foreign_key "scandidates", "senates"
  add_foreign_key "svotes", "scandidates"
  add_foreign_key "votes", "candidates"
  add_foreign_key "zipcodes", "houses"
  add_foreign_key "zipcodes", "senates"
end
