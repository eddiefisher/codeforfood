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

ActiveRecord::Schema.define(:version => 20130124161430) do

  create_table "layouts", :id => false, :force => true do |t|
    t.uuid     "id",         :null => false
    t.string   "name"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "layouts", ["name"], :name => "index_layouts_on_name"

  create_table "origins", :force => true do |t|
    t.string   "name"
    t.string   "host"
    t.string   "path"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "page_parts", :id => false, :force => true do |t|
    t.uuid     "id",         :null => false
    t.string   "name"
    t.text     "body"
    t.uuid     "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "handler"
  end

  add_index "page_parts", ["name"], :name => "index_page_parts_on_name"
  add_index "page_parts", ["page_id"], :name => "index_page_parts_on_page_id"

  create_table "pages", :id => false, :force => true do |t|
    t.uuid     "id",                         :null => false
    t.string   "name"
    t.string   "slug"
    t.string   "layout_name"
    t.string   "status"
    t.uuid     "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",       :default => 0
    t.string   "location"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.text     "locales"
  end

  add_index "pages", ["location"], :name => "index_pages_on_location"
  add_index "pages", ["slug"], :name => "index_pages_on_slug"

  create_table "puffer_users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "roles"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "snippets", :id => false, :force => true do |t|
    t.uuid     "id",         :null => false
    t.string   "name"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "snippets", ["name"], :name => "index_snippets_on_name"

end
