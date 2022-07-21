json.extract! team, :id, :member_id, :project_id, :currency_id, :annual_rate, :weekly_rate, :start_date, :end_date, :allocation, :created_at, :updated_at
json.url team_url(team, format: :json)
