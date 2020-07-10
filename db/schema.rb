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

ActiveRecord::Schema.define(version: 2020_07_10_143939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.integer "current_balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "buyers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "country"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "amount_recievable", default: 0
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "name"
    t.integer "quantity", default: 0
    t.float "price_per_lbs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "bag_array", default: [], array: true
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
    t.string "bag_array"
    t.index ["seller_id"], name: "index_purchase_recipts_on_seller_id"
  end

  create_table "sell_reciepts", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.integer "quantity"
    t.float "price_per_lbs"
    t.bigint "buyer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_sell_reciepts_on_buyer_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "country"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "amount_payable", default: 0
  end

  create_table "transactions", force: :cascade do |t|
    t.string "to_type"
    t.bigint "to_id"
    t.string "from_type"
    t.bigint "from_id"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "to_name"
    t.string "from_name"
    t.index ["from_type", "from_id"], name: "index_transactions_on_from_type_and_from_id"
    t.index ["to_type", "to_id"], name: "index_transactions_on_to_type_and_to_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
