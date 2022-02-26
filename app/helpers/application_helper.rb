module ApplicationHelper
    def admin?
        current_user.admin == true
    end

    def full_user
        "#{current_user.first_name} #{current_user.last_name}"
    end
end
