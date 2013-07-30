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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130730004457) do

  create_table "applieds", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "job_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "applieds", ["employee_id"], :name => "index_applieds_on_employee_id"
  add_index "applieds", ["job_id"], :name => "index_applieds_on_job_id"

  create_table "contact_purchases", :force => true do |t|
    t.integer  "employer_id"
    t.integer  "employee_id"
    t.string   "charge_id"
    t.boolean  "refunded",    :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "contact_purchases", ["employee_id"], :name => "index_contact_purchases_on_employee_id"
  add_index "contact_purchases", ["employer_id"], :name => "index_contact_purchases_on_employer_id"

  create_table "feedbacks", :force => true do |t|
    t.text     "message"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "feedbacks", ["user_id"], :name => "index_feedbacks_on_user_id"

  create_table "job_experiences", :force => true do |t|
    t.string   "title"
    t.string   "company"
    t.string   "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "resume_id"
  end

  add_index "job_experiences", ["resume_id"], :name => "index_job_experiences_on_resume_id"

  create_table "jobs", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "pay",         :default => 7.25
    t.integer  "employer_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "city"
    t.string   "state"
  end

  add_index "jobs", ["employer_id"], :name => "index_jobs_on_employer_id"

  create_table "references", :force => true do |t|
    t.string   "name"
    t.string   "relationship"
    t.string   "length_known"
    t.string   "phone_number"
    t.string   "email"
    t.integer  "resume_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "resumes", :force => true do |t|
    t.string   "phone_number"
    t.string   "address"
    t.string   "job_experience"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "employee_id"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.text     "description"
    t.date     "birthday"
    t.string   "highest_education"
    t.string   "highest_major"
    t.string   "current_education"
    t.string   "current_major"
    t.date     "graduation_date"
  end

  add_index "resumes", ["employee_id"], :name => "index_resumes_on_employee_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "type"
    t.boolean  "reviewed"
    t.integer  "score"
    t.string   "company_name"
    t.boolean  "can_contact",            :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
