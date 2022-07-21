json.extract! project, :id, :stream_id, :name, :is_internal, :is_trackable, :start_date, :end_date, :is_active, :created_at, :updated_at
json.url project_url(project, format: :json)
