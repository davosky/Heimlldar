json.extract! holiday, :id, :name, :start_time, :end_time, :user_id, :description, :created_at, :updated_at, :creator, :updater, :cancelled
json.url holidays_url(holiday, format: :json)
