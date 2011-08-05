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

ActiveRecord::Schema.define(:version => 20110805094021) do

  create_table "changes", :force => true do |t|
    t.integer  "ticket_id"
    t.integer  "owner_old"
    t.integer  "owner_new"
    t.integer  "status_old"
    t.integer  "status_new", :null => false
    t.text     "reply_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.string   "number",         :limit => 10
    t.string   "customer_name"
    t.string   "customer_email"
    t.string   "subject"
    t.text     "request_text"
    t.integer  "department"
    t.integer  "status",                       :default => 1
    t.integer  "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",   :limit => 15
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.string   "salt"
  end

end
