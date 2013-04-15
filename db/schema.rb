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

ActiveRecord::Schema.define(:version => 20130415120256) do

  create_table "agree_quastions", :force => true do |t|
    t.integer  "quastion_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "agree_quastions", ["quastion_id"], :name => "index_agree_quastions_on_quastion_id"

  create_table "agree_thoughts", :force => true do |t|
    t.integer  "thought_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "agree_thoughts", ["thought_id"], :name => "index_agree_thoughts_on_thought_id"

  create_table "agreements", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quastion_id"
    t.integer  "thought_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "agreements", ["user_id"], :name => "index_agreements_on_user_id"

  create_table "folowers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "thinker_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "folowers", ["user_id"], :name => "index_folowers_on_user_id"

  create_table "great_thoughts", :force => true do |t|
    t.string   "quotation"
    t.string   "author"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "been",       :default => false
  end

  create_table "personal_infos", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "gender"
    t.integer  "age"
    t.string   "image"
    t.string   "country"
    t.string   "marital_status"
    t.string   "credo"
    t.string   "religion"
    t.string   "political_views"
    t.string   "smf_more"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "personal_infos", ["user_id"], :name => "index_personal_infos_on_user_id"

  create_table "quastions", :force => true do |t|
    t.string   "discription",                   :null => false
    t.string   "topic",                         :null => false
    t.integer  "rate",        :default => 110
    t.string   "image",       :default => "no", :null => false
    t.integer  "user_id"
    t.boolean  "pass"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "quastions", ["user_id"], :name => "index_quastions_on_user_id"

  create_table "thoughts", :force => true do |t|
    t.integer  "user_id",     :default => 5
    t.integer  "quastion_id"
    t.integer  "rate",        :default => 0
    t.string   "point",                      :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "thoughts", ["quastion_id"], :name => "index_thoughts_on_quastion_id"
  add_index "thoughts", ["user_id"], :name => "index_thoughts_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "nickname"
    t.string   "provider"
    t.string   "url"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "rate",                   :default => 100
    t.boolean  "visible",                :default => true
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
