class OvertimesController < ApplicationController
  before_action :set_overtime, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  def index
    unless current_user.admin == true || current_user.manager == true
      @q = Overtime.ransack(params[:q])
      @overtimes = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Overtime.ransack(params[:q])
      @overtimes = @q.result(distinct: true)
    end
  end

  def monthly_view
    unless current_user.admin == true || current_user.manager == true
      @q = Overtime.ransack(params[:q])
      @overtimes = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Overtime.ransack(params[:q])
      @overtimes = @q.result(distinct: true)
    end
  end

  def list_view
    unless current_user.admin == true || current_user.manager == true
      @q = Overtime.ransack(params[:q])
      @overtimes = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Overtime.ransack(params[:q])
      @overtimes = @q.result(distinct: true)
    end
  end

  def show
  end

  def new
    @overtime = Overtime.new
  end

  def edit
  end

  def delete_error
  end

  def create
    if current_user.admin == true || current_user.manager == true
      @overtime = Overtime.new(overtime_params)
    else
      @overtime = current_user.overtimes.build(overtime_params)
    end

    @overtime.creator = "#{current_user.last_name} #{current_user.first_name}"

    respond_to do |format|
      if @overtime.save
        format.html { redirect_to overtimes_url, notice: "Assenza creata con successo." }
        format.json { render :show, status: :created, location: @overtime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @overtime.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @overtime.updater = "#{current_user.last_name} #{current_user.first_name}"

    respond_to do |format|
      if @overtime.update(overtime_params)
        format.html { redirect_to overtime_url(@overtime), notice: "Assenza aggiornata con successo." }
        format.json { render :show, status: :ok, location: @overtime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @overtime.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @overtime.destroy
      respond_to do |format|
        format.html { redirect_to overtimes_url, notice: "Assenza eliminata con successo." }
        format.json { head :no_content }
      end
  end

  private
    def set_overtime
      @overtime = Overtime.find(params[:id])
    end

    def overtime_params
      params.require(:overtime).permit(:name, :start_time, :end_time, :user_id, :description, :creator, :updater, :cancelled)
    end
end
