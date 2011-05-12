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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110504073539) do

  create_table "account_types", :force => true do |t|
    t.string   "name"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bankings", :force => true do |t|
    t.integer  "user_id",         :null => false
    t.integer  "account_type_id", :null => false
    t.string   "bank_name"
    t.string   "account_type"
    t.integer  "account_number"
    t.string   "name_of_holder"
    t.string   "father_name"
    t.string   "address"
    t.date     "date"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bidding_zones", :force => true do |t|
    t.string   "name",        :null => false
    t.integer  "state_id",    :null => false
    t.text     "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bulk_vle_mails", :force => true do |t|
    t.text     "mail_subject"
    t.text     "mail_body"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "csc_blocks", :force => true do |t|
    t.string   "name",            :null => false
    t.text     "description"
    t.integer  "state_id",        :null => false
    t.integer  "bidding_zone_id", :null => false
    t.integer  "district_id",     :null => false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", :force => true do |t|
    t.string   "name",            :null => false
    t.integer  "bidding_zone_id", :null => false
    t.integer  "state_id",        :null => false
    t.text     "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurance_transactions", :force => true do |t|
    t.integer  "user_id",        :null => false
    t.integer  "policy_number"
    t.string   "company"
    t.string   "policy_name"
    t.integer  "premium_amount"
    t.string   "remarks"
    t.date     "date"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurances", :force => true do |t|
    t.integer  "user_id",       :null => false
    t.integer  "policy_number"
    t.string   "name"
    t.string   "policy_name"
    t.string   "company_name"
    t.integer  "amount"
    t.integer  "premium_id",    :null => false
    t.integer  "no_of_years"
    t.string   "remarks"
    t.date     "date"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "premia", :force => true do |t|
    t.string   "name"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "states", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["name"], :name => "index_states_on_name", :unique => true

  create_table "transactions", :force => true do |t|
    t.integer  "user_id",                                            :null => false
    t.string   "bank_name"
    t.integer  "account_number"
    t.string   "mode_of_transaction"
    t.decimal  "amount",              :precision => 10, :scale => 0
    t.date     "date"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "phone_number"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                         :null => false
    t.integer  "login_count",       :default => 0,          :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "status",            :default => "Approved"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

  create_table "vle_documents", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.string   "agreement_paper"
    t.boolean  "address_proof"
    t.boolean  "education_proof"
    t.boolean  "photograph_proof"
    t.string   "dd_number"
    t.date     "dd_date"
    t.string   "dd_bank_name"
    t.string   "dd_branch_name"
    t.integer  "dd_amount"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vle_representative_profiles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "state_id"
    t.integer  "bidding_zone_id"
    t.integer  "district_id"
    t.integer  "csc_block_id"
    t.string   "father_name"
    t.string   "address"
    t.string   "pincode"
    t.date     "date_of_birth"
    t.string   "csc_panchayat"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
