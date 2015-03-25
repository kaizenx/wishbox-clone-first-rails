class ProductPriceListsController < ApplicationController
  before_action :set_product_price_list, only: [:show, :edit, :update, :destroy]

  # GET /product_price_lists
  # GET /product_price_lists.json
  def index
    @product_price_lists = ProductPriceList.all
  end

  # GET /product_price_lists/1
  # GET /product_price_lists/1.json
  def show
  end

  # GET /product_price_lists/new
  def new
    @product_price_list = ProductPriceList.new
  end

  # GET /product_price_lists/1/edit
  def edit
  end

  # POST /product_price_lists
  # POST /product_price_lists.json
  def create
    @product_price_list = ProductPriceList.new(product_price_list_params)

    respond_to do |format|
      if @product_price_list.save
        format.html { redirect_to @product_price_list, notice: 'Product price list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_price_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_price_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_price_lists/1
  # PATCH/PUT /product_price_lists/1.json
  def update
    respond_to do |format|
      if @product_price_list.update(product_price_list_params)
        format.html { redirect_to @product_price_list, notice: 'Product price list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_price_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_price_lists/1
  # DELETE /product_price_lists/1.json
  def destroy
    @product_price_list.destroy
    respond_to do |format|
      format.html { redirect_to product_price_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_price_list
      @product_price_list = ProductPriceList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_price_list_params
      params.require(:product_price_list).permit(:Price, :DayOfYear)
    end
end
