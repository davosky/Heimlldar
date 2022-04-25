class HolidaysController < ApplicationController
  before_action :set_holiday, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  def index
    unless current_user.admin == true || current_user.manager == true
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true)
    end
  end

  def monthly_view
    unless current_user.admin == true || current_user.manager == true
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true)
    end
  end

  def list_view
    unless current_user.admin == true || current_user.manager == true
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true).where(user_id: current_user).order("start_time DESC")
    else
      @q = Holiday.ransack(params[:q])
      @holidays = @q.result(distinct: true).order("start_time DESC")
    end
  end

  def show
  end

  def new
    @holiday = Holiday.new
  end

  def edit
  end

  def delete_error
  end

  def create
    if current_user.admin == true || current_user.manager == true
      @holiday = Holiday.new(holiday_params)
    else
      @holiday = current_user.holidays.build(holiday_params)
    end

    @holiday.creator = "#{current_user.last_name} #{current_user.first_name}"

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to holidays_url, notice: "Assenza creata con successo." }
        format.json { render :show, status: :created, location: @holiday }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @holiday.updater = "#{current_user.last_name} #{current_user.first_name}"

    respond_to do |format|
      if @holiday.update(holiday_params)
        format.html { redirect_to holiday_url(@holiday), notice: "Assenza aggiornata con successo." }
        format.json { render :show, status: :ok, location: @holiday }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @holiday.destroy
    respond_to do |format|
      format.html { redirect_to holidays_url, notice: "Assenza eliminata con successo." }
      format.json { head :no_content }
    end
  end

  private

  def set_holiday
    @holiday = Holiday.find(params[:id])
  end

  def holiday_params
    params.require(:holiday).permit(:name, :start_time, :end_time, :user_id, :description, :creator, :updater, :cancelled)
  end
end
