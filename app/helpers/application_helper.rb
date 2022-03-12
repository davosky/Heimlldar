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

        case
        when @eweeknumber - @sweeknumber == 0
            @period = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @period = @period +1
        when @eweeknumber - @sweeknumber == 1
            @period = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @period = @period -1
        when @eweeknumber - @sweeknumber == 2
            @period = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @period = @period -3
        when @eweeknumber - @sweeknumber == 3
            @period = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @period = @period -5
        when @eweeknumber - @sweeknumber == 3
            @period = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @period = @period -7
        when @eweeknumber - @sweeknumber == 4
            @period = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @period = @period -9
        when @eweeknumber - @sweeknumber == 5
            @period = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @period = @period -11
        when @eweeknumber - @sweeknumber == 6
            @period = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @period = @period -13
        when @eweeknumber - @sweeknumber == 7
            @period = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @period = @period -15
        when @eweeknumber - @sweeknumber == 8
            @period = TimeDifference.between(absence.start_time, absence.end_time).in_days
            @period = @period -17
        else
            1000
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

        case
        when @eweeknumber - @sweeknumber == 0
            @period = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @period = @period +1
        when @eweeknumber - @sweeknumber == 1
            @period = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @period = @period -1
        when @eweeknumber - @sweeknumber == 2
            @period = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @period = @period -3
        when @eweeknumber - @sweeknumber == 3
            @period = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @period = @period -5
        when @eweeknumber - @sweeknumber == 3
            @period = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @period = @period -7
        when @eweeknumber - @sweeknumber == 4
            @period = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @period = @period -9
        when @eweeknumber - @sweeknumber == 5
            @period = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @period = @period -11
        when @eweeknumber - @sweeknumber == 6
            @period = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @period = @period -13
        when @eweeknumber - @sweeknumber == 7
            @period = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @period = @period -15
        when @eweeknumber - @sweeknumber == 8
            @period = TimeDifference.between(disease.start_time, disease.end_time).in_days
            @period = @period -17
        else
            1000
        end
    end
end
