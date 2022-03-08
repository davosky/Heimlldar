class AbsencesController < ApplicationController
  before_action :set_absence, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  def index
    unless current_user.admin == true || current_user.manager == true
      @absences = Absence.where(user_id: current_user)
    else
      @absences = Absence.all
    end
  end

  def monthly_view
    unless current_user.admin == true || current_user.manager == true
      @absences = Absence.where(user_id: current_user)
    else
      @absences = Absence.all
    end
  end

  def list_view
    unless current_user.admin == true || current_user.manager == true
      @absences = Absence.where(user_id: current_user)
    else
      @absences = Absence.all
    end
  end

  def show
  end

  def new
    @absence = Absence.new
  end

  def edit
  end

  def delete_error
  end

  def create
    if current_user.admin == true || current_user.manager == true
      @absence = Absence.new(absence_params)
    else
      @absence = current_user.absences.build(absence_params)
    end

    @absence.creator = "#{current_user.last_name} #{current_user.first_name}"

    respond_to do |format|
      if @absence.save
        format.html { redirect_to absences_url, notice: "Assenza creata con successo." }
        format.json { render :show, status: :created, location: @absence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @absence.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @absence.updater = "#{current_user.last_name} #{current_user.first_name}"

    respond_to do |format|
      if @absence.update(absence_params)
        format.html { redirect_to absence_url(@absence), notice: "Assenza aggiornata con successo." }
        format.json { render :show, status: :ok, location: @absence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @absence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @absence.destroy
      respond_to do |format|
        format.html { redirect_to absences_url, notice: "Assenza eliminata con successo." }
        format.json { head :no_content }
      end
  end

  private
    def set_absence
      @absence = Absence.find(params[:id])
    end

    def absence_params
      params.require(:absence).permit(:name, :start_time, :end_time, :user_id, :absence_type_id, :description, :creator, :updater)
    end
end
