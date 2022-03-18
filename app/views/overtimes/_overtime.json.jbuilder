json.extract! overtime, :id, :name, :start_time, :end_time, :user_id, :description, :created_at, :updated_at, :creator, :updater, :cancelled
json.url overtimes_url(overtime, format: :json)
