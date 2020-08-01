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

ActiveRecord::Schema.define(version: 2020_07_31_162710) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "email_templates", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_applications", force: :cascade do |t|
    t.string "candidate_name"
    t.datetime "apply_date"
    t.string "resume_result"
    t.text "videotranscript"
    t.string "video_result"
    t.bigint "position_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["position_id"], name: "index_job_applications_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.datetime "due_date"
    t.string "must_qualities", array: true
    t.bigint "reject_template_id", null: false
    t.bigint "accept_template_id", null: false
    t.bigint "pastdue_template_id", null: false
    t.integer "passing_score"
    t.integer "resume_score_ratio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accept_template_id"], name: "index_positions_on_accept_template_id"
    t.index ["pastdue_template_id"], name: "index_positions_on_pastdue_template_id"
    t.index ["reject_template_id"], name: "index_positions_on_reject_template_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "job_application_id", null: false
    t.text "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_application_id"], name: "index_questionnaires_on_job_application_id"
    t.index ["question_id"], name: "index_questionnaires_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "job_applications", "positions"
  add_foreign_key "positions", "email_templates", column: "accept_template_id"
  add_foreign_key "positions", "email_templates", column: "pastdue_template_id"
  add_foreign_key "positions", "email_templates", column: "reject_template_id"
  add_foreign_key "questionnaires", "job_applications"
  add_foreign_key "questionnaires", "questions"
end
