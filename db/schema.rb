# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091019172939) do

  create_table "listeners", :force => true do |t|
    t.string   "name"
    t.string   "shortcode_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mufflers", :force => true do |t|
    t.string   "pattern"
    t.integer  "shooter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shooters", :force => true do |t|
    t.string   "name"
    t.string   "shortcode_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "payload"
    t.boolean  "active"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "webhooks", :force => true do |t|
    t.string   "url"
    t.integer  "shooter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
