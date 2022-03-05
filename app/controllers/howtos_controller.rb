class HowtosController < ApplicationController
  before_action :set_howto, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  def index
    @howtos = Howto.all
  end

  def show
  end

  def new
    @howto = Howto.new
  end

  def edit
  end

  def create
    @howto = Howto.new(howto_params)

    respond_to do |format|
      if @howto.save
        format.html { redirect_to howto_url(@howto), notice: "Howto was successfully created." }
        format.json { render :show, status: :created, location: @howto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @howto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @howto.update(howto_params)
        format.html { redirect_to howto_url(@howto), notice: "Howto was successfully updated." }
        format.json { render :show, status: :ok, location: @howto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @howto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @howto.destroy

    respond_to do |format|
      format.html { redirect_to howtos_url, notice: "Howto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_howto
      @howto = Howto.find(params[:id])
    end

    def howto_params
      params.require(:howto).permit(:name, :topic_id, :description)
    end
end
