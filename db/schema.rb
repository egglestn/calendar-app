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

ActiveRecord::Schema.define(version: 20170418120604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.string   "documentable_type"
    t.integer  "documentable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file"
    t.integer  "developer_id"
    t.integer  "division_id"
    t.integer  "development_id"
    t.index ["developer_id"], name: "index_documents_on_developer_id", using: :btree
    t.index ["development_id"], name: "index_documents_on_development_id", using: :btree
    t.index ["division_id"], name: "index_documents_on_division_id", using: :btree
    t.index ["documentable_type", "documentable_id"], name: "index_documents_on_documentable_type_and_documentable_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.string   "color"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string  "title"
    t.string  "imageable_type"
    t.integer "imageable_id"
    t.string  "file"
    t.integer "developer_id"
    t.integer "division_id"
    t.integer "development_id"
    t.index ["developer_id"], name: "index_images_on_developer_id", using: :btree
    t.index ["development_id"], name: "index_images_on_development_id", using: :btree
    t.index ["division_id"], name: "index_images_on_division_id", using: :btree
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "samples", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "user_login_contents", force: :cascade do |t|
    t.string   "title_left"
    t.string   "title_right"
    t.text     "blurb_para_1"
    t.text     "blurb_para_2"
    t.string   "background_image"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "developer_id"
    t.integer  "division_id"
    t.index ["developer_id"], name: "index_users_on_developer_id", using: :btree
    t.index ["division_id"], name: "index_users_on_division_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
