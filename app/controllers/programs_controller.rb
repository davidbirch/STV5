class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]
  force_ssl
  before_filter :authenticate  

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all
    
    if params[:region]
      @programs = @programs.where(region_id: Region.find_by_name(params[:region]))
    end
    
    if params[:sport]
      @programs = @programs.where(sport_id: Sport.find_by_name(params[:sport]))
    end
    
    if params[:channel]
      @programs = @programs.where(channel_id: Channel.find_by_name(params[:channel]))
    end
    
    @title = "Programs | Sport on Television in Australia"
    @breadcrumb = "Programs"
    
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    @title = "Program: " + @program.full_title + " | Sport on Television in Australia"
    @breadcrumb = "Program: "+ @program.full_title
  end

  # GET /programs/new
  def new
    @program = Program.new
    @breadcrumb = "New Program"
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render action: 'show', status: :created, location: @program }
      else
        format.html { render action: 'new' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:title, :subtitle, :region_id, :sport_id, :channel_id, :category, :description, :start_datetime, :end_datetime)
    end
end
