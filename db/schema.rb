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

ActiveRecord::Schema[8.1].define(version: 2022_02_14_202731) do
  create_table "news", charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "category", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.datetime "end_time", precision: nil
    t.string "image"
    t.string "locale", null: false
    t.boolean "sent", default: false
    t.datetime "start_time", precision: nil
    t.datetime "time", precision: nil, null: false
    t.string "title", null: false
    t.string "uid", null: false
    t.datetime "updated_at", null: false
    t.string "url", null: false
    t.index ["category"], name: "index_news_on_category"
    t.index ["created_at"], name: "index_news_on_created_at"
    t.index ["locale"], name: "index_news_on_locale"
    t.index ["sent"], name: "index_news_on_sent"
    t.index ["uid"], name: "index_news_on_uid", unique: true
  end

  create_table "news_meta", charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.datetime "expires_at", precision: nil
    t.string "locale"
    t.datetime "modified_at", precision: nil
    t.index ["locale"], name: "index_news_meta_on_locale"
  end

  create_table "webhooks", charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "developers"
    t.string "locale", null: false
    t.boolean "maintenance"
    t.boolean "notices"
    t.boolean "status"
    t.boolean "topics"
    t.datetime "updated_at", null: false
    t.boolean "updates"
    t.string "url", null: false
    t.index ["developers"], name: "index_webhooks_on_developers"
    t.index ["locale"], name: "index_webhooks_on_locale"
    t.index ["maintenance"], name: "index_webhooks_on_maintenance"
    t.index ["notices"], name: "index_webhooks_on_notices"
    t.index ["status"], name: "index_webhooks_on_status"
    t.index ["topics"], name: "index_webhooks_on_topics"
    t.index ["updates"], name: "index_webhooks_on_updates"
  end
end
