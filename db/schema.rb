# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141209054620) do

  create_table "assignments", force: true do |t|
    t.string   "assignment_title"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "course_name"
    t.string   "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "examinations", force: true do |t|
    t.string   "exam_title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.text     "feedback_comments"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.string   "exam_result"
    t.integer  "student_id"
    t.integer  "examination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "roletype"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "admission_no"
    t.date     "admission_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "blood_group"
    t.string   "language"
    t.text     "address"
    t.string   "phone"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submitted_assignments", force: true do |t|
    t.string   "assignment_answer"
    t.integer  "assignment_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
  end

  create_table "submitted_examinations", force: true do |t|
    t.integer  "examination_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainers", force: true do |t|
    t.string   "employee_number"
    t.date     "joining_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "qualification"
    t.text     "experience_detail"
    t.integer  "experience_year"
    t.text     "home_address"
    t.string   "mobile_phone"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "f_name"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
