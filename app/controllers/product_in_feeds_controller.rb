class ProductInFeedsController < ApplicationController
  before_action :set_product_in_feed, only: [:show, :edit, :update, :destroy]

  # GET /product_in_feeds
  # GET /product_in_feeds.json
  def index
    @product_in_feeds = ProductInFeed.all
  end

  # GET /product_in_feeds/1
  # GET /product_in_feeds/1.json
  def show
  end

  # GET /product_in_feeds/new
  def new
    @product_in_feed = ProductInFeed.new
  end

  # GET /product_in_feeds/1/edit
  def edit
  end

  # POST /product_in_feeds
  # POST /product_in_feeds.json
  def create
    @product_in_feed = ProductInFeed.new(product_in_feed_params)

    respond_to do |format|
      if @product_in_feed.save
        format.html { redirect_to @product_in_feed, notice: 'Product in feed was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_in_feed }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_in_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_in_feeds/1
  # PATCH/PUT /product_in_feeds/1.json
  def update
    respond_to do |format|
      if @product_in_feed.update(product_in_feed_params)
        format.html { redirect_to @product_in_feed, notice: 'Product in feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_in_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_in_feeds/1
  # DELETE /product_in_feeds/1.json
  def destroy
    @product_in_feed.destroy
    respond_to do |format|
      format.html { redirect_to product_in_feeds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_in_feed
      @product_in_feed = ProductInFeed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_in_feed_params
      params.require(:product_in_feed).permit(:productid, :feedid)
    end
end
