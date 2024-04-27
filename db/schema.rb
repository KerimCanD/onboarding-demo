# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_22_211351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bundles", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_bundles_on_company_id"
  end

  create_table "bundles_products", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "bundle_id", null: false
    t.integer "quantity"
    t.index ["bundle_id", "product_id"], name: "index_bundles_products_on_bundle_id_and_product_id"
    t.index ["product_id", "bundle_id"], name: "index_bundles_products_on_product_id_and_bundle_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "lead_time"
    t.integer "days_of_stock"
    t.integer "forecasting_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.float "price"
    t.integer "stock", default: 0
    t.bigint "vendor_id"
    t.bigint "warehouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
    t.index ["warehouse_id"], name: "index_products_on_warehouse_id"
  end

  create_table "products_purchase_orders", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "purchase_order_id", null: false
    t.integer "quantity"
    t.index ["product_id", "purchase_order_id"], name: "idx_on_product_id_purchase_order_id_5b6ba4b747"
    t.index ["purchase_order_id", "product_id"], name: "idx_on_purchase_order_id_product_id_3423d8f5b9"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.bigint "company_id"
    t.integer "status"
    t.bigint "vendor_id"
    t.date "order_date"
    t.date "arrival_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_purchase_orders_on_company_id"
    t.index ["vendor_id"], name: "index_purchase_orders_on_vendor_id"
  end

  create_table "sale_histories", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "product_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_sale_histories_on_company_id"
    t.index ["product_id"], name: "index_sale_histories_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_vendors_on_company_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_warehouses_on_company_id"
  end

end
