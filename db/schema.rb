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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170622175116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "histories", force: true do |t|
    t.integer  "product_feed_id"
    t.datetime "updated"
    t.datetime "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imports", force: true do |t|
    t.string   "title"
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_contents"
    t.string   "state",         default: "new"
    t.datetime "imported_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_feeds", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price"
    t.string   "image_url"
    t.string   "source",         default: "desktop"
    t.string   "campaign_name"
    t.string   "import_id"
    t.boolean  "deleted",        default: false
    t.string   "affiliate_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
