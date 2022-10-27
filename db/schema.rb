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

ActiveRecord::Schema.define(version: 2022_10_27_135341) do

  create_table "admins", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true
  end

  create_table "currencies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.decimal "exchange_rate", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "division"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_departments_on_user_id"
  end

  create_table "jira_issues", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "jira_issue_id"
    t.bigint "jira_project_id", null: false
    t.string "issue_key"
    t.text "issue_url"
    t.text "issue_title"
    t.text "issue_status"
    t.text "issue_type"
    t.integer "story_points"
    t.datetime "issue_created"
    t.datetime "issue_updated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jira_project_id"], name: "index_jira_issues_on_jira_project_id"
  end

  create_table "jira_projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "project_id"
    t.integer "jira_project_id"
    t.text "name"
    t.string "jira_key"
    t.integer "total_issue_count"
    t.datetime "last_issue_update"
    t.text "self_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_active"
    t.bigint "role_id", null: false
    t.bigint "department_id", null: false
    t.bigint "source_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "jira_account_id"
    t.index ["department_id"], name: "index_members_on_department_id"
    t.index ["jira_account_id"], name: "index_members_on_jira_account_id"
    t.index ["role_id"], name: "index_members_on_role_id"
    t.index ["source_id"], name: "index_members_on_source_id"
  end

  create_table "project_statistics", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "project_name", null: false
    t.integer "week_number"
    t.integer "month_number"
    t.integer "year_number"
    t.integer "bug_count"
    t.integer "story_count"
    t.integer "task_count"
    t.integer "team_count"
    t.integer "open_bugs"
    t.integer "open_stories"
    t.integer "open_tasks"
    t.integer "closed_bugs"
    t.integer "closed_stories"
    t.integer "closed_tasks"
    t.integer "capex_points"
    t.integer "opex_points"
    t.decimal "weekly_team_cost", precision: 10
    t.decimal "weekly_capex", precision: 10
    t.decimal "weekly_opex", precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "dropped_bugs"
    t.integer "dropped_stories"
    t.integer "dropped_tasks"
    t.index ["project_id"], name: "index_project_statistics_on_project_id"
  end

  create_table "projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "stream_id", null: false
    t.string "name"
    t.boolean "is_internal"
    t.boolean "is_trackable"
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stream_id"], name: "index_projects_on_stream_id"
  end

  create_table "resource_budgets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "currency_id", null: false
    t.date "period_start"
    t.date "period_end"
    t.integer "classification", default: 0
    t.decimal "base_rate", precision: 10
    t.decimal "weekly_rate", precision: 10
    t.decimal "monthly_rate", precision: 10
    t.decimal "annual_rate", precision: 10
    t.integer "fiscal_year"
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rate_type"
    t.index ["currency_id"], name: "index_resource_budgets_on_currency_id"
    t.index ["member_id"], name: "index_resource_budgets_on_member_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "is_shared"
    t.boolean "is_administration"
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_roles_on_department_id"
  end

  create_table "sources", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "contact_name"
    t.string "contact_title"
    t.string "contact_phone"
    t.string "contact_email"
    t.boolean "is_internal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "streams", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "business_unit"
    t.string "stakeholder_name"
    t.string "stakeholder_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "project_id", null: false
    t.bigint "currency_id", null: false
    t.decimal "annual_rate", precision: 10
    t.decimal "weekly_rate", precision: 10
    t.date "start_date"
    t.date "end_date"
    t.integer "allocation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_teams_on_currency_id"
    t.index ["member_id"], name: "index_teams_on_member_id"
    t.index ["project_id"], name: "index_teams_on_project_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "departments", "users"
  add_foreign_key "jira_issues", "jira_projects"
  add_foreign_key "members", "departments"
  add_foreign_key "members", "roles"
  add_foreign_key "members", "sources"
  add_foreign_key "project_statistics", "projects"
  add_foreign_key "projects", "streams"
  add_foreign_key "resource_budgets", "currencies"
  add_foreign_key "resource_budgets", "members"
  add_foreign_key "roles", "departments"
  add_foreign_key "teams", "currencies"
  add_foreign_key "teams", "members"
  add_foreign_key "teams", "projects"
end
