json.extract! absence, :id, :name, :start_time, :end_time, :user_id, :description, :created_at, :updated_at, :creator, :updater
json.url absences_url(absence, format: :json)
