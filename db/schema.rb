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

ActiveRecord::Schema.define(:version => 20130619175331) do

  create_table "images", :force => true do |t|
    t.string   "uri"
    t.string   "caption"
    t.integer  "place_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "images", ["place_id"], :name => "index_images_on_place_id"

  create_table "instagram_accounts", :force => true do |t|
    t.integer  "uid"
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "instagram_accounts", ["user_id"], :name => "index_instagram_accounts_on_user_id"

  create_table "journal_entries", :force => true do |t|
    t.string   "title"
    t.text     "post"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "place_id"
  end

  create_table "places", :force => true do |t|
    t.string   "place"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "trip_id"
    t.integer  "previous_place_id"
    t.integer  "next_place_id"
  end

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
