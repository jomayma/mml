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

ActiveRecord::Schema.define(:version => 20130528204629) do

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "summary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "readers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reviews", :force => true do |t|
    t.string   "relation_with"
    t.string   "rating"
    t.text     "review"
    t.integer  "readers_id"
    t.integer  "books_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
