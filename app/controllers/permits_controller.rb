class PermitsController < ApplicationController
  before_action :set_permit, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  def index
    unless current_user.admin == true || current_user.manager == true
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true)
    end
  end

  def monthly_view
    unless current_user.admin == true || current_user.manager == true
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true)
    end
  end

  def list_view
    unless current_user.admin == true || current_user.manager == true
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true).where(user_id: current_user)
    else
      @q = Permit.ransack(params[:q])
      @permits = @q.result(distinct: true)
    end
  end

  def show
  end

  def new
    @permit = Permit.new
  end

  def edit
  end

  def delete_error
  end

  def create
    if current_user.admin == true || current_user.manager == true
      @permit = Permit.new(permit_params)
      @permit.end_time = @permit.start_time
    else
      @permit = current_user.permits.build(permit_params)
      @permit.end_time = @permit.start_time
    end

    @permit.creator = "#{current_user.last_name} #{current_user.first_name}"

    respond_to do |format|
      if @permit.save
        format.html { redirect_to permits_url, notice: "Assenza creata con successo." }
        format.json { render :show, status: :created, location: @permit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @permit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @permit.end_time = @permit.start_time
    
    @permit.updater = "#{current_user.last_name} #{current_user.first_name}"

    respond_to do |format|
      if @permit.update(permit_params)
        format.html { redirect_to permit_url(@permit), notice: "Assenza aggiornata con successo." }
        format.json { render :show, status: :ok, location: @permit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @permit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @permit.destroy
      respond_to do |format|
        format.html { redirect_to permits_url, notice: "Assenza eliminata con successo." }
        format.json { head :no_content }
      end
  end

  private
    def set_permit
      @permit = Permit.find(params[:id])
    end

    def permit_params
      params.require(:permit).permit(:name, :start_time, :end_time, :user_id, :description, :creator, :updater, :morning, :afternoon, :cancelled)
    end
end
