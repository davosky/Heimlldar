class DiseasesController < ApplicationController
  before_action :set_disease, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  def index
    unless current_user.admin == true || current_user.manager == true
      @q = Disease.ransack(params[:q])
      @diseases = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Disease.ransack(params[:q])
      @diseases = @q.result(distinct: true)
    end
  end

  def monthly_view
    unless current_user.admin == true || current_user.manager == true
      @q = Disease.ransack(params[:q])
      @diseases = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Disease.ransack(params[:q])
      @diseases = @q.result(distinct: true)
    end
  end

  def list_view
    unless current_user.admin == true || current_user.manager == true
      @q = Disease.ransack(params[:q])
      @diseases = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Disease.ransack(params[:q])
      @diseases = @q.result(distinct: true)
    end
  end

  def show
  end

  def new
    @disease = Disease.new
  end

  def edit
  end

  def delete_error
  end

  def create
    if current_user.admin == true || current_user.manager == true
      @disease = Disease.new(disease_params)
    else
      @disease = current_user.diseases.build(disease_params)
    end

    @disease.creator = "#{current_user.last_name} #{current_user.first_name}"

    respond_to do |format|
      if @disease.save
        format.html { redirect_to diseases_url, notice: "Assenza creata con successo." }
        format.json { render :show, status: :created, location: @disease }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @disease.updater = "#{current_user.last_name} #{current_user.first_name}"

    respond_to do |format|
      if @disease.update(disease_params)
        format.html { redirect_to disease_url(@disease), notice: "Assenza aggiornata con successo." }
        format.json { render :show, status: :ok, location: @disease }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @disease.destroy
      respond_to do |format|
        format.html { redirect_to diseases_url, notice: "Assenza eliminata con successo." }
        format.json { head :no_content }
      end
  end

  private
    def set_disease
      @disease = Disease.find(params[:id])
    end

    def disease_params
      params.require(:disease).permit(:name, :start_time, :end_time, :user_id, :description, :creator, :updater)
    end
end
