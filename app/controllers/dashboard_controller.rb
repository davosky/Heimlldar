class DashboardController < ApplicationController
  def index
    unless current_user.admin == true || current_user.manager == true
      @q = Absence.ransack(params[:q])
      @absences = @q.result(distinct: true).where(user_id: current_user)
        .where(start_time: Date.today)
    else
      @q = Absence.ransack(params[:q])
      @absences = @q.result(distinct: true).where(start_time: Date.today)
    end

    unless current_user.admin == true || current_user.manager == true
      dstart = Date.today.to_date.beginning_of_day
      dend = Date.today.to_date.end_of_day
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true)
                    .where(user_id: current_user)
                    .where(start_time: dstart..dend)
    else
      dstart = Date.today.to_date.beginning_of_day
      dend = Date.today.to_date.end_of_day
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true)
                    .where(start_time: dstart..dend)
    end

    unless current_user.admin == true || current_user.manager == true
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true).where(user_id: current_user)
        .where(start_time: Date.today)
    else
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true).where(start_time: Date.today)
    end

    unless current_user.admin == true || current_user.manager == true
      @q = Disease.ransack(params[:q])
      @diseases = @q.result(distinct: true).where(user_id: current_user)
        .where(start_time: Date.today)
    else
      @q = Disease.ransack(params[:q])
      @diseases = @q.result(distinct: true).where(start_time: Date.today)
    end
  end

  def search; end

  def credits; end

  def authorization; end
end
