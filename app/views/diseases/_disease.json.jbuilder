json.extract! disease, :id, :name, :start_time, :end_time, :user_id, :description, :created_at, :updated_at, :creator, :updater, :cancelled
json.url diseases_url(disease, format: :json)
