# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_12_103124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventory_items", force: :cascade do |t|
    t.string "name"
    t.integer "quantity", default: 0
    t.float "price_per_lbs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.float "amount"
    t.boolean "cleared", default: false
    t.datetime "cleared_at"
    t.string "paymentable_type"
    t.bigint "paymentable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["paymentable_type", "paymentable_id"], name: "index_payments_on_paymentable_type_and_paymentable_id"
  end

  create_table "purchase_recipts", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.float "price_per_lbs"
    t.bigint "seller_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seller_id"], name: "index_purchase_recipts_on_seller_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "country"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
