class PageFeedsController < ApplicationController
  before_action :set_page_feed, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /page_feeds
  # GET /page_feeds.json
  def index
    @page_feeds = PageFeed.all
  end

  # GET /page_feeds/1
  # GET /page_feeds/1.json
  def show
  end

  # GET /page_feeds/new
  def new
    @page_feed = PageFeed.new
  end

  # GET /page_feeds/1/edit
  def edit
  end

  # POST /page_feeds
  # POST /page_feeds.json
  def create
    @page_feed = PageFeed.new(page_feed_params)

    respond_to do |format|
      if @page_feed.save
        format.html { redirect_to @page_feed, notice: 'Page feed was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page_feed }
      else
        format.html { render action: 'new' }
        format.json { render json: @page_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_feeds/1
  # PATCH/PUT /page_feeds/1.json
  def update
    respond_to do |format|
      if @page_feed.update(page_feed_params)
        format.html { redirect_to @page_feed, notice: 'Page feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_feeds/1
  # DELETE /page_feeds/1.json
  def destroy
    @page_feed.destroy
    respond_to do |format|
      format.html { redirect_to page_feeds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_feed
      @page_feed = PageFeed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_feed_params
      params.require(:page_feed).permit(:FeedList, :UserId)
    end
end
