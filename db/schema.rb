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

ActiveRecord::Schema.define(version: 20180228225145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact"
    t.string "phone"
    t.string "email"
    t.string "address"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "nit"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.bigint "brand_id"
    t.bigint "unit_id"
    t.bigint "category_id"
    t.integer "min_stock"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stock"
    t.decimal "cost_price", precision: 8, scale: 2
    t.decimal "unit_price", precision: 8, scale: 2
    t.date "due_date"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["unit_id"], name: "index_items_on_unit_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "code"
    t.string "first_name"
    t.string "last_name"
    t.date "birthday"
    t.integer "age"
    t.string "phone"
    t.string "email"
    t.string "dpi"
    t.string "sex"
    t.string "manager"
    t.string "nit"
    t.string "alergies"
    t.text "annotations"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.index ["room_id"], name: "index_patients_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_details", force: :cascade do |t|
    t.integer "sale_id"
    t.integer "number"
    t.integer "item_id"
    t.integer "qty"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "number"
    t.date "date"
    t.integer "state"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.string "nit"
    t.string "client"
    t.string "tipo_pago"
    t.string "estado", default: "inprogress"
    t.bigint "client_id"
    t.string "name"
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["patient_id"], name: "index_sales_on_patient_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "description"
    t.decimal "day_price"
    t.decimal "night_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "towns", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "units"
  add_foreign_key "patients", "rooms"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "patients"
end
