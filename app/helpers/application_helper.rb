module ApplicationHelper
    def admin?
        current_user.admin == true
    end

    def admanager?
        current_user.admin == true || current_user.manager == true
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
        @sweeknumber = absence.start_time.cweek.to_i()
        @eweeknumber = absence.end_time.cweek.to_i()
        @period = @eweeknumber - @sweeknumber

        if @period = 0
            @timeamount = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @timeamount = @timeamount +1
        else
            @timeamount = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @timeamount = @timeamount - ((@period * 2) -1)
        end
    end

    def disease_full_user(disease)
        "#{disease.user.first_name} #{disease.user.last_name}"
    end

    def owner?(disease)
        current_user.admin == true || current_user.manager == true || current_user.id == disease.user_id
    end

    def disease_duration(disease)
        @sweeknumber = disease.start_time.cweek.to_i()
        @eweeknumber = disease.end_time.cweek.to_i()
        @period = @eweeknumber - @sweeknumber

        if @period = 0
            @timeamount = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @timeamount = @timeamount +1
        else
            @timeamount = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @timeamount = @timeamount - ((@period * 2) -1)
        end
    end
end
