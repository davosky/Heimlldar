class AbsencesController < ApplicationController
  before_action :set_absence, only: %i[ show edit update destroy ]

  def index
    @absences = Absence.all
  end

  def show
  end

  def new
    @absence = Absence.new
  end

  def edit
  end

  def create
    @absence = Absence.new(absence_params)

    respond_to do |format|
      if @absence.save
        format.html { redirect_to absence_url(@absence), notice: "Absence was successfully created." }
        format.json { render :show, status: :created, location: @absence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @absence.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @absence.update(absence_params)
        format.html { redirect_to absence_url(@absence), notice: "Absence was successfully updated." }
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
      format.html { redirect_to absences_url, notice: "Absence was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_absence
      @absence = Absence.find(params[:id])
    end

    def absence_params
      params.require(:absence).permit(:name, :start_time, :end_time, :user_id, :absence_type_id, :description)
    end
end
