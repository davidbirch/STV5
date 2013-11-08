class SportKeywordsController < ApplicationController
  before_action :set_sport_keyword, only: [:show, :edit, :update, :destroy]

  # GET /sport_keywords
  # GET /sport_keywords.json
  def index
    @sport_keywords = SportKeyword.all
  end

  # GET /sport_keywords/1
  # GET /sport_keywords/1.json
  def show
  end

  # GET /sport_keywords/new
  def new
    @sport_keyword = SportKeyword.new
  end

  # GET /sport_keywords/1/edit
  def edit
  end

  # POST /sport_keywords
  # POST /sport_keywords.json
  def create
    @sport_keyword = SportKeyword.new(sport_keyword_params)

    respond_to do |format|
      if @sport_keyword.save
        format.html { redirect_to @sport_keyword, notice: 'Sport keyword was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sport_keyword }
      else
        format.html { render action: 'new' }
        format.json { render json: @sport_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sport_keywords/1
  # PATCH/PUT /sport_keywords/1.json
  def update
    respond_to do |format|
      if @sport_keyword.update(sport_keyword_params)
        format.html { redirect_to @sport_keyword, notice: 'Sport keyword was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sport_keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sport_keywords/1
  # DELETE /sport_keywords/1.json
  def destroy
    @sport_keyword.destroy
    respond_to do |format|
      format.html { redirect_to sport_keywords_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport_keyword
      @sport_keyword = SportKeyword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sport_keyword_params
      params.require(:sport_keyword).permit(:rule_type, :value, :sport_id, :priority)
    end
end
