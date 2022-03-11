module ApplicationHelper
    def admin?
        current_user.admin == true
    end

    def full_user
        "#{current_user.first_name} #{current_user.last_name}"
    end

    def absence_full_user(absence)
        "#{absence.user.first_name} #{absence.user.last_name}"
    end

    def owner?(absence)
        current_user.admin == true || current_user.manager == true || current_user.id == absence.user_id
    end

    def absence_duration(absence)
        TimeDifference.between(absence.start_time, absence.end_time).in_days + 1
    end
end
