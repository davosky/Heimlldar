module ApplicationHelper
    def admin?
        current_user.admin == true
    end

    def full_user
        "#{current_user.first_name} #{current_user.last_name}"
    end

    def absence_type?(absence)
        if absence.absence_type.name == 'Malattia'
            "danger"
        elsif absence.absence_type.name == 'Permesso'
            "warning"
        else
            "info"
        end
    end
end
