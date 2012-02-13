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

ActiveRecord::Schema.define(:version => 20120213165511) do

  create_table "initiatives", :force => true do |t|
    t.string   "name"
    t.integer  "priority"
    t.integer  "quarter_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "initiatives", ["quarter_id"], :name => "index_initiatives_on_quarter_id"

  create_table "planitems", :force => true do |t|
    t.integer  "team_id"
    t.integer  "initiative_id"
    t.integer  "sprint_id"
    t.string   "description"
    t.string   "itemtype"
    t.boolean  "committed"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "planitems", ["initiative_id"], :name => "index_planitems_on_initiative_id"
  add_index "planitems", ["sprint_id"], :name => "index_planitems_on_sprint_id"
  add_index "planitems", ["team_id"], :name => "index_planitems_on_team_id"

  create_table "quarters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sprints", :force => true do |t|
    t.string   "name"
    t.integer  "quarter_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sprints", ["quarter_id"], :name => "index_sprints_on_quarter_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "group"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "login",                              :default => "", :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
