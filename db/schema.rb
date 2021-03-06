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

ActiveRecord::Schema.define(version: 2018_10_15_092454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "kind"
    t.string "street"
    t.bigint "company_id"
    t.bigint "pincode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_addresses_on_company_id"
    t.index ["pincode_id"], name: "index_addresses_on_pincode_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "product_id", null: false
    t.index ["category_id", "product_id"], name: "index_categories_products_on_category_id_and_product_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id"
    t.float "lat"
    t.float "lng"
    t.integer "std_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.integer "parent_id"
    t.string "pan_number"
    t.string "gst_end"
    t.float "days", default: 30.0
    t.float "balance"
    t.float "open_balance", default: 0.0
    t.text "spl_instructions"
    t.float "payment_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "harmonics", force: :cascade do |t|
    t.integer "hsn"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_id"
    t.float "discount"
    t.float "amount"
    t.float "mrp"
    t.float "rate"
    t.float "gst"
    t.float "total"
    t.bigint "packing_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_items_on_order_id"
    t.index ["packing_id"], name: "index_items_on_packing_id"
    t.index ["product_id"], name: "index_items_on_product_id"
  end

  create_table "mails", force: :cascade do |t|
    t.string "eadd"
    t.integer "primary"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_mails_on_company_id"
  end

  create_table "numbers", force: :cascade do |t|
    t.string "num"
    t.integer "primary"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_numbers_on_company_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "transport_id"
    t.integer "status", default: 0
    t.date "completed_date"
    t.date "confirmed_date"
    t.date "packed_date"
    t.date "invoiced_date"
    t.date "dispatched_date"
    t.date "released_date"
    t.integer "invoice_number"
    t.float "invoice_amount"
    t.float "invoice_subtotal"
    t.float "quantity_kg"
    t.float "quantity_l"
    t.string "lr"
    t.float "freight"
    t.float "courier_charge", default: 0.0
    t.float "igst"
    t.float "cgst"
    t.float "sgst"
    t.string "remark", default: "N/A"
    t.bigint "user_id"
    t.string "lr_photo"
    t.string "salesperson"
    t.float "other_taxes", default: 0.0
    t.float "misc_charges", default: 0.0
    t.bigint "address_id"
    t.float "sample_kg"
    t.float "sample_l"
    t.integer "order_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["company_id"], name: "index_orders_on_company_id"
    t.index ["transport_id"], name: "index_orders_on_transport_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "packings", force: :cascade do |t|
    t.float "rebate"
    t.float "pack_size"
    t.boolean "sample"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pincodes", force: :cascade do |t|
    t.integer "pin"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_pincodes_on_city_id"
  end

  create_table "products", force: :cascade do |t|
    t.float "discount"
    t.text "description"
    t.bigint "type_id"
    t.float "mrp"
    t.float "gst"
    t.string "unit"
    t.bigint "harmonic_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["harmonic_id"], name: "index_products_on_harmonic_id"
    t.index ["type_id"], name: "index_products_on_type_id"
  end

  create_table "products_uses", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "use_id", null: false
    t.index ["product_id", "use_id"], name: "index_products_uses_on_product_id_and_use_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transports", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "village"
    t.string "number"
    t.boolean "courier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
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
    t.bigint "company_id"
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.integer "role"
    t.date "dob"
    t.integer "aadhar"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "uses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "companies"
  add_foreign_key "addresses", "pincodes"
  add_foreign_key "cities", "states"
  add_foreign_key "items", "orders"
  add_foreign_key "items", "packings"
  add_foreign_key "items", "products"
  add_foreign_key "mails", "companies"
  add_foreign_key "numbers", "companies"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "companies"
  add_foreign_key "orders", "transports"
  add_foreign_key "orders", "users"
  add_foreign_key "pincodes", "cities"
  add_foreign_key "products", "harmonics"
  add_foreign_key "products", "types"
  add_foreign_key "users", "companies"
end
