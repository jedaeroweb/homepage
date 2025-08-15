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

ActiveRecord::Schema[7.1].define(version: 2025_08_15_065956) do
  create_table "accounts", force: :cascade do |t|
    t.integer "account_category_id", null: false
    t.integer "user_id"
    t.date "transaction_date", null: false
    t.string "refund", default: "0", null: false
    t.integer "cash", default: 0, null: false
    t.integer "credit", default: 0, null: false
    t.integer "point", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_category_id"], name: "index_accounts_on_account_category_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "accounts_orders", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "order_id", null: false
    t.boolean "enable", default: true, null: false
    t.index ["account_id"], name: "index_accounts_orders_on_account_id"
    t.index ["order_id"], name: "index_accounts_orders_on_order_id"
  end

  create_table "accounts_products", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "product_id", null: false
    t.boolean "enable", default: true, null: false
    t.index ["account_id"], name: "index_accounts_products_on_account_id"
    t.index ["product_id"], name: "index_accounts_products_on_product_id"
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "admins", force: :cascade do |t|
    t.string "email", limit: 100, null: false
    t.string "name", limit: 100, null: false
    t.string "encrypted_password", limit: 60, null: false
    t.string "photo", limit: 150
    t.boolean "enable", default: true, null: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "authentication_providers", force: :cascade do |t|
    t.string "name", limit: 60, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["name"], name: "index_name_on_authentication_providers"
  end

  create_table "contact_contents", force: :cascade do |t|
    t.text "content", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "user_id"
    t.string "name", limit: 60, null: false
    t.string "email", limit: 200, null: false
    t.string "title", limit: 60, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faq_categories", force: :cascade do |t|
    t.integer "faqs_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faq_category_translations", force: :cascade do |t|
    t.integer "faq_category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["faq_category_id"], name: "index_faq_category_translations_on_faq_category_id"
    t.index ["locale"], name: "index_faq_category_translations_on_locale"
  end

  create_table "faq_content_translations", force: :cascade do |t|
    t.integer "faq_content_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.index ["faq_content_id"], name: "index_faq_content_translations_on_faq_content_id"
    t.index ["locale"], name: "index_faq_content_translations_on_locale"
  end

  create_table "faq_contents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faq_translations", force: :cascade do |t|
    t.integer "faq_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["faq_id"], name: "index_faq_translations_on_faq_id"
    t.index ["locale"], name: "index_faq_translations_on_locale"
  end

  create_table "faqs", force: :cascade do |t|
    t.integer "faq_category_id", null: false
    t.integer "count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faq_category_id"], name: "index_faqs_on_faq_category_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "transaction_date", null: false
    t.integer "price", default: 0, null: false
    t.integer "discount", default: 0, null: false
    t.integer "payment", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_products", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "price", default: 0, null: false
    t.integer "quantity", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.index ["order_id"], name: "index_orders_products_on_order_id"
    t.index ["product_id"], name: "index_orders_products_on_product_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "title", null: false
    t.integer "order_no", default: 0, null: false
    t.integer "products_count", default: 0, null: false
    t.boolean "display", default: true, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_category_contents", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_contents", force: :cascade do |t|
    t.integer "product_id", null: false
    t.text "content", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_contents_on_product_id"
  end

  create_table "product_pictures", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "picture", null: false
    t.string "caption", limit: 60
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_pictures_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "product_category_id", null: false
    t.string "title", limit: 60, null: false
    t.string "description", limit: 230
    t.integer "order_no", default: 0, null: false
    t.integer "price", default: 0
    t.integer "product_pictures_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "program_categories", force: :cascade do |t|
    t.integer "program_language_id", null: false
    t.string "title", limit: 60, null: false
    t.string "link", limit: 200
    t.integer "program_categories_programs_count", default: 0, null: false
    t.boolean "main", default: true, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "program_categories_programs", force: :cascade do |t|
    t.integer "program_category_id", null: false
    t.integer "program_id", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_category_id"], name: "index_program_categories_programs_on_program_category_id"
    t.index ["program_id"], name: "index_program_categories_programs_on_program_id"
  end

  create_table "program_contents", force: :cascade do |t|
    t.text "content", null: false
  end

  create_table "program_languages", force: :cascade do |t|
    t.string "title", limit: 60, null: false
    t.string "link", limit: 200
    t.integer "program_categories_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "program_link_categories", force: :cascade do |t|
    t.string "title", limit: 60, null: false
    t.integer "program_links_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "program_links", force: :cascade do |t|
    t.integer "program_link_category_id", null: false
    t.integer "program_id", null: false
    t.string "title", limit: 60, null: false
    t.string "link", limit: 200, null: false
    t.string "description", limit: 200
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_program_links_on_program_id"
    t.index ["program_link_category_id"], name: "index_program_links_on_program_link_category_id"
  end

  create_table "program_pictures", force: :cascade do |t|
    t.integer "program_id", null: false
    t.string "picture", null: false
    t.string "caption", limit: 60
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_program_pictures_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "title", limit: 60, null: false
    t.string "description", limit: 200
    t.string "service_link", limit: 200
    t.boolean "use_database", default: true, null: false
    t.integer "program_categories_programs_count", default: 0, null: false
    t.integer "program_pictures_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "report_categories", force: :cascade do |t|
    t.string "title", limit: 60, null: false
    t.integer "reports_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "report_contents", force: :cascade do |t|
    t.text "content", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "report_category_id", null: false
    t.integer "user_id", null: false
    t.string "title", limit: 60, null: false
    t.integer "default_view_count", default: 0, null: false
    t.integer "report_comments_count", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_category_id"], name: "index_reports_on_report_category_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "user_authentications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "authentication_provider_id"
    t.string "uid"
    t.string "token"
    t.datetime "token_expires_at", precision: nil
    t.text "params"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["authentication_provider_id"], name: "index_user_authentications_on_authentication_provider_id"
    t.index ["user_id"], name: "index_user_authentications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone"
    t.string "email"
    t.string "address"
    t.date "birthday"
    t.integer "orders_count", default: 0, null: false
    t.integer "accounts_count", default: 0, null: false
    t.boolean "display", default: true, null: false
    t.boolean "enable", default: true, null: false
    t.string "encrypted_password", limit: 60, null: false
    t.string "photo", limit: 150
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
