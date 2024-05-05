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

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bundles", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_bundles_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "default_lead_time"
    t.integer "default_days_of_stock"
    t.integer "default_forecasting_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landed_costs", force: :cascade do |t|
    t.bigint "purchase_order_id"
    t.float "cost"
    t.integer "cost_type"
    t.index ["purchase_order_id"], name: "index_landed_costs_on_purchase_order_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.integer "stock", default: 0
    t.bigint "supplier_id"
    t.bigint "warehouse_id"
    t.string "sku"
    t.string "vendor"
    t.integer "days_of_stock"
    t.integer "lead_time"
    t.integer "forecasting_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
    t.index ["warehouse_id"], name: "index_products_on_warehouse_id"
  end

  create_table "products_bundles", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "bundle_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bundle_id", "product_id"], name: "index_products_bundles_on_bundle_id_and_product_id"
    t.index ["bundle_id"], name: "index_products_bundles_on_bundle_id"
    t.index ["product_id", "bundle_id"], name: "index_products_bundles_on_product_id_and_bundle_id"
    t.index ["product_id"], name: "index_products_bundles_on_product_id"
  end

  create_table "products_purchase_orders", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "purchase_order_id"
    t.integer "quantity"
    t.float "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "purchase_order_id"], name: "idx_on_product_id_purchase_order_id_5b6ba4b747"
    t.index ["product_id"], name: "index_products_purchase_orders_on_product_id"
    t.index ["purchase_order_id", "product_id"], name: "idx_on_purchase_order_id_product_id_3423d8f5b9"
    t.index ["purchase_order_id"], name: "index_products_purchase_orders_on_purchase_order_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.bigint "company_id"
    t.integer "status"
    t.bigint "supplier_id"
    t.date "order_date"
    t.date "arrival_date"
    t.integer "shipping_method"
    t.bigint "warehouse_id"
    t.string "tracking_code"
    t.integer "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_purchase_orders_on_company_id"
    t.index ["supplier_id"], name: "index_purchase_orders_on_supplier_id"
    t.index ["warehouse_id"], name: "index_purchase_orders_on_warehouse_id"
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

  create_table "suppliers", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "tax_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_suppliers_on_company_id"
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

  create_table "warehouses", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_warehouses_on_company_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
