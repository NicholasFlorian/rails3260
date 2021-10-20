class DiesController < ApplicationController
  before_action :set_dy, only: %i[ show edit update destroy ]

  # GET /dies or /dies.json
  def index
    @dies = Die.all
  end

  # GET /dies/1 or /dies/1.json
  def show
  end

  # GET /dies/new
  def new
    @dy = Die.new
  end

  # GET /dies/1/edit
  def edit
  end

  # POST /dies or /dies.json
  def create
    @dy = Die.new(dy_params)

    respond_to do |format|
      if @dy.save
        format.html { redirect_to @dy, notice: "Die was successfully created." }
        format.json { render :show, status: :created, location: @dy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dies/1 or /dies/1.json
  def update
    respond_to do |format|
      if @dy.update(dy_params)
        format.html { redirect_to @dy, notice: "Die was successfully updated." }
        format.json { render :show, status: :ok, location: @dy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dies/1 or /dies/1.json
  def destroy
    @dy.destroy
    respond_to do |format|
      format.html { redirect_to dies_url, notice: "Die was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dy
      @dy = Die.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dy_params
      params.require(:dy).permit(:fk_user_id, :colour, :sides)
    end
end
