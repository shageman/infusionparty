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

ActiveRecord::Schema.define(:version => 20130112204349) do

  create_table "drinks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.float    "drinkable_mean"
    t.float    "drinkable_deviation"
    t.float    "presentation_mean"
    t.float    "presentation_deviation"
    t.float    "adventure_mean"
    t.float    "adventure_deviation"
  end

  create_table "votes", :force => true do |t|
    t.integer  "drink1_id"
    t.integer  "drink2_id"
    t.integer  "category_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "best_presentation"
    t.integer  "most_adventurous"
    t.integer  "most_drinkable"
  end

  add_index "votes", ["category_id"], :name => "index_votes_on_category_id"
  add_index "votes", ["drink1_id"], :name => "index_votes_on_drink1_id"
  add_index "votes", ["drink2_id"], :name => "index_votes_on_drink2_id"

end
