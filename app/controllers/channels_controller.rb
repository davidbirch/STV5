class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  force_ssl
  before_filter :authenticate  
  
  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.order("name ASC").load
    @title = "Channels | Sport on Television in Australia"
    @breadcrumb = "Channels"
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    @title = "Channel: " + @channel.name + " | Sport on Television in Australia"
    @breadcrumb = "Channel: "+ @channel.name
  end

  # GET /channels/new
  def new
    @channel = Channel.new
    @breadcrumb = "New Channel"
  end

  # GET /channels/1/edit
  def edit
    @title = "Channel: " + @channel.name + " | Sport on Television in Australia"
    @breadcrumb = "Channel: "+ @channel.name
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @channel }
      else
        format.html { render action: 'new' }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /channels/1/toggle_black_flag
  def toggle_black_flag
    @channel = Channel.find(params[:id])
    @channel.toggle!(:black_flag)
     
    respond_to do |format|
      if @channel.save
        format.html { redirect_to channels_url, notice: 'Channel was successfully updated.' }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:name, :short_name, :free_or_pay, :xmltv_id, :black_flag)
    end
end
