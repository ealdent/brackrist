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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120927202755) do

  create_table "alts", :force => true do |t|
    t.integer  "pilot_1_id", :null => false
    t.integer  "pilot_2_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "alts", ["pilot_1_id", "pilot_2_id"], :name => "index_alts_on_pilot_1_id_and_pilot_2_id", :unique => true

  create_table "corporations", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "corporations", ["name"], :name => "index_corporations_on_name", :unique => true

  create_table "pilots", :force => true do |t|
    t.string   "name",           :null => false
    t.integer  "corporation_id"
    t.integer  "user_id"
    t.text     "reason"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "pilots", ["corporation_id"], :name => "index_pilots_on_corporation_id"
  add_index "pilots", ["name"], :name => "index_pilots_on_name", :unique => true
  add_index "pilots", ["user_id"], :name => "index_pilots_on_user_id"

  create_table "user_logins", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "ip_address"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_logins", ["user_id"], :name => "index_user_logins_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                            :null => false
    t.string   "password",                         :null => false
    t.string   "salt",                             :null => false
    t.integer  "access_level",      :default => 0, :null => false
    t.integer  "persistence_token"
    t.datetime "last_login"
    t.string   "last_login_ip"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
