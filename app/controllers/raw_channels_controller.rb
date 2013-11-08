class RawChannelsController < ApplicationController
  before_action :set_raw_channel, only: [:show, :edit, :update, :destroy]

  # GET /raw_channels
  # GET /raw_channels.json
  def index
    @raw_channels = RawChannel.all
  end

  # GET /raw_channels/1
  # GET /raw_channels/1.json
  def show
  end

  # GET /raw_channels/new
  def new
    @raw_channel = RawChannel.new
  end

  # GET /raw_channels/1/edit
  def edit
  end

  # POST /raw_channels
  # POST /raw_channels.json
  def create
    @raw_channel = RawChannel.new(raw_channel_params)

    respond_to do |format|
      if @raw_channel.save
        format.html { redirect_to @raw_channel, notice: 'Raw channel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @raw_channel }
      else
        format.html { render action: 'new' }
        format.json { render json: @raw_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_channels/1
  # PATCH/PUT /raw_channels/1.json
  def update
    respond_to do |format|
      if @raw_channel.update(raw_channel_params)
        format.html { redirect_to @raw_channel, notice: 'Raw channel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @raw_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_channels/1
  # DELETE /raw_channels/1.json
  def destroy
    @raw_channel.destroy
    respond_to do |format|
      format.html { redirect_to raw_channels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_channel
      @raw_channel = RawChannel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_channel_params
      params.require(:raw_channel).permit(:channel_name, :xmltv_id)
    end
end
