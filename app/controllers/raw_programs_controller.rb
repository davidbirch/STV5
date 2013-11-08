class RawProgramsController < ApplicationController
  before_action :set_raw_program, only: [:show, :edit, :update, :destroy]

  # GET /raw_programs
  # GET /raw_programs.json
  def index
    @raw_programs = RawProgram.all
  end

  # GET /raw_programs/1
  # GET /raw_programs/1.json
  def show
  end

  # GET /raw_programs/new
  def new
    @raw_program = RawProgram.new
  end

  # GET /raw_programs/1/edit
  def edit
  end

  # POST /raw_programs
  # POST /raw_programs.json
  def create
    @raw_program = RawProgram.new(raw_program_params)

    respond_to do |format|
      if @raw_program.save
        format.html { redirect_to @raw_program, notice: 'Raw program was successfully created.' }
        format.json { render action: 'show', status: :created, location: @raw_program }
      else
        format.html { render action: 'new' }
        format.json { render json: @raw_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_programs/1
  # PATCH/PUT /raw_programs/1.json
  def update
    respond_to do |format|
      if @raw_program.update(raw_program_params)
        format.html { redirect_to @raw_program, notice: 'Raw program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @raw_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_programs/1
  # DELETE /raw_programs/1.json
  def destroy
    @raw_program.destroy
    respond_to do |format|
      format.html { redirect_to raw_programs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_program
      @raw_program = RawProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_program_params
      params.require(:raw_program).permit(:title, :subtitle, :category, :description, :start_datetime, :end_datetime, :region_name, :channel_xmltv_id)
    end
end
