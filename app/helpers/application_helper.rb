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

    def absence_type?(absence)
        if absence.absence_type.name == 'MALATTIA'
            "danger"
        elsif absence.absence_type.name == 'PERMESSO'
            "warning"
        else
            "info"
        end
    end

    def absence_type_icon?(absence)
        if absence.absence_type.name == 'MALATTIA'
            "fas fa-thermometer-three-quarters"
        elsif absence.absence_type.name == 'PERMESSO'
            "fas fa-bath"
        else
            "fas fa-plane"
        end
    end

    def owner?(absence)
        current_user.admin == true || current_user.manager == true || current_user.id == absence.user_id
    end
end
