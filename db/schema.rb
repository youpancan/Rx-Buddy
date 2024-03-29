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

ActiveRecord::Schema[7.0].define(version: 2023_03_15_140056) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.string "allergy_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatbots", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chatbots_on_user_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "strength"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "ingredients"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatbot_id", null: false
    t.boolean "from_chatbot", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatbot_id"], name: "index_messages_on_chatbot_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "refill_id", null: false
    t.index ["refill_id"], name: "index_notifications_on_refill_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.date "order_date"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "refills", force: :cascade do |t|
    t.text "notes"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_medication_id", null: false
    t.integer "status", default: 0, null: false
    t.integer "urgency", default: 3, null: false
    t.date "pick_up_date", default: -> { "(CURRENT_TIMESTAMP + 'P10D'::interval)" }, null: false
    t.index ["order_id"], name: "index_refills_on_order_id"
    t.index ["user_medication_id"], name: "index_refills_on_user_medication_id"
  end

  create_table "user_allergies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "allergy_id", null: false
    t.string "severity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allergy_id"], name: "index_user_allergies_on_allergy_id"
    t.index ["user_id"], name: "index_user_allergies_on_user_id"
  end

  create_table "user_medications", force: :cascade do |t|
    t.bigint "medication_id", null: false
    t.bigint "user_id", null: false
    t.integer "number_refills"
    t.string "prescriber"
    t.date "refill_due_date"
    t.boolean "refillable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication_id"], name: "index_user_medications_on_medication_id"
    t.index ["user_id"], name: "index_user_medications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.text "address"
    t.string "phone_number"
    t.text "pharmacy_location"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chatbots", "users"
  add_foreign_key "messages", "chatbots"
  add_foreign_key "notifications", "refills"
  add_foreign_key "orders", "users"
  add_foreign_key "refills", "orders"
  add_foreign_key "refills", "user_medications"
  add_foreign_key "user_allergies", "allergies"
  add_foreign_key "user_allergies", "users"
  add_foreign_key "user_medications", "medications"
  add_foreign_key "user_medications", "users"
end
