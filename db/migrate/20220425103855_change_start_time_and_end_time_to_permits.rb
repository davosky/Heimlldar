class ChangeStartTimeAndEndTimeToPermits < ActiveRecord::Migration[7.0]
  def change
    change_column :permits, :start_time, :datetime
    change_column :permits, :end_time, :datetime
    remove_column :permits, :afternoon, :boolean
    remove_column :permits, :morning, :boolean
  end
end
