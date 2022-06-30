module ApplicationHelper
  # USER ========================================================

  def admin?
    current_user.admin == true
  end

  def admanager?
    current_user.admin == true || current_user.manager == true
  end

  def full_user
    "#{current_user.first_name} #{current_user.last_name}"
  end

  # =============================================================

  # ABSENCE =====================================================
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

    if @period < 1
      @timeamount = TimeDifference.between(absence.start_time, absence.end_time).in_days
      @timeamount = @timeamount + 1
    else
      @timeamount = TimeDifference.between(absence.start_time, absence.end_time).in_days
      @timeamount = @timeamount - ((@period * 2) - 1)
    end
  end

  def absence_range(absence)
    Date.today >= absence.start_time && Date.today <= absence.end_time
  end

  # =============================================================

  # DISDEASE ====================================================

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

    if @period < 1
      @timeamount = TimeDifference.between(disease.start_time, disease.end_time).in_days
      @timeamount = @timeamount + 1
    else
      @timeamount = TimeDifference.between(disease.start_time, disease.end_time).in_days
      @timeamount = @timeamount - ((@period * 2) - 1)
    end
  end

  def disease_range(disease)
    Date.today >= disease.start_time && Date.today <= disease.end_time
  end

  # =============================================================

  # HOLIDAY =====================================================

  def holiday_full_user(holiday)
    "#{holiday.user.first_name} #{holiday.user.last_name}"
  end

  def owner?(holiday)
    current_user.admin == true || current_user.manager == true || current_user.id == holiday.user_id
  end

  def holiday_duration(holiday)
    @timeamount = TimeDifference.between(holiday.start_time, holiday.end_time).in_hours
  end

  # =============================================================

  # OVERTIME ====================================================

  def overtime_full_user(overtime)
    "#{overtime.user.first_name} #{overtime.user.last_name}"
  end

  def owner?(overtime)
    current_user.admin == true || current_user.manager == true || current_user.id == overtime.user_id
  end

  def overtime_duration(overtime)
    @timeamount = TimeDifference.between(overtime.start_time, overtime.end_time).in_hours
  end

  # =============================================================

  # PERMIT ======================================================

  def permit_full_user(permit)
    "#{permit.user.first_name} #{permit.user.last_name}"
  end

  def owner?(permit)
    current_user.admin == true || current_user.manager == true || current_user.id == permit.user_id
  end

  def permit_duration(permit)
    @timeamount = TimeDifference.between(permit.start_time, permit.end_time).in_hours
  end

  # =============================================================
end
