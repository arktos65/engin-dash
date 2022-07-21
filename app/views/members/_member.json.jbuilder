json.extract! member, :id, :first_name, :last_name, :start_date, :end_date, :is_active, :role_id, :department_id, :source_id, :created_at, :updated_at
json.url member_url(member, format: :json)
