class TrendingTagsController < ApplicationController
  before_action :set_trending_tag, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /trending_tags
  # GET /trending_tags.json
  def index
    @trending_tags = TrendingTag.all
  end

  # GET /trending_tags/1
  # GET /trending_tags/1.json
  def show
  end

  # GET /trending_tags/new
  def new
    @trending_tag = TrendingTag.new
  end

  # GET /trending_tags/1/edit
  def edit
  end

  # POST /trending_tags
  # POST /trending_tags.json
  def create
    @trending_tag = TrendingTag.new(trending_tag_params)

    respond_to do |format|
      if @trending_tag.save
        format.html { redirect_to @trending_tag, notice: 'Trending tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trending_tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @trending_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trending_tags/1
  # PATCH/PUT /trending_tags/1.json
  def update
    respond_to do |format|
      if @trending_tag.update(trending_tag_params)
        format.html { redirect_to @trending_tag, notice: 'Trending tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trending_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trending_tags/1
  # DELETE /trending_tags/1.json
  def destroy
    @trending_tag.destroy
    respond_to do |format|
      format.html { redirect_to trending_tags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trending_tag
      @trending_tag = TrendingTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trending_tag_params
      params.require(:trending_tag).permit(:Tags)
    end
end
