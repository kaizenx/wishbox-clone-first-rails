class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :item, :preview]
  # fixes cancan issue with strong params
  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  load_and_authorize_resource

  def create_product
    feed = Product.new(:CreatedByUserId => current_user.id, :Title => "DEFAULT PRODUCT", :slug => "default-product", :IsPublished => false )
    feed.save
    redirect_to '/products'
  end

  def get_voucher_code(merchantid)
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    string = (0...8).map { o[rand(o.length)] }.join
    puts merchantid.to_s+string
  end

  def get_merchant_id(productid)
    product = Product.find_by(id:productid)
    merchantid = -1
    if not product.nil?
      merchantid = product.MerchantId
    end
    return merchantid
  end

  def all_currencies(hash)
    hash.keys
  end
  
  def subscreen
  end

  def shop
    productid = params[:id]
    product = Product.find(productid)
    merchantid = get_merchant_id(productid)
    voucher_code = get_voucher_code(merchantid)
    tripid = cookies[:current_tripid]
    usershoppingcart = UserShoppingCart.where(userid: current_user.id, 
                                              Price: product.Price,
                                              TripId: tripid,
                                              isshow: true,
                                              productid: productid ).take
    if usershoppingcart != nil
      usershoppingcart.Quantity = usershoppingcart.Quantity + 1
      usershoppingcart.save
    else
      usershoppingcart = UserShoppingCart.new(userid: current_user.id, 
                                                Title: product.Title, 
                                                Price: product.Price,
                                                TripId: tripid,
                                                productid: productid, 
                                                isshow: true, 
                                                IsBought:false,
                                                VoucherCode:voucher_code,
                                                Quantity:1 )
      usershoppingcart.save
    end
    
    # add to itinerary that means we need to know FeedId and TripId
    
    itinerary = Itinerary.new(UserId: current_user.id,
                              ProductId: productid,
                              TripId: tripid
                              )
    itinerary.save
  end

  def want

  end
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def item
    oauth_access_token = session['authdata']
    @username = "Bob"
    if oauth_access_token != nil
      @graph = Koala::Facebook::API.new(oauth_access_token)
      @friends = @graph.get_connections("me", "friends")
      profile = @graph.get_object("me")
      @username = profile["first_name"]
      friend_id_list = FriendList.select("FriendUserId").where(UserId:current_user.id)
      friends_tokenized = friend_id_list.map(&:FriendUserId)
      @friends_touristly = User.readonly.where(id:friends_tokenized).order("id desc")
      
      @add_friends_to_friendlist = "/friend_lists/invite_friend/"
      @invite_people_to_trip = "/invited_to_trips/invite/"
    end
    # get a list of all the images that this product has in Galleries
    @images_from_gallery = Gallery.where( productid:@product.id )
    @savings = @product.BasePrice * @product.DiscountPercentage / 100
    @highlights = @product.Highlights.split('->')
    @conditions = @product.Condition.split('->')
  end
  def preview
    # strategy = Devise.omniauth_configs[:facebook].strategy
    # puts strategy.client_id
    @images_from_gallery = Gallery.where( productid:@product.id )
    @savings = @product.BasePrice * @product.DiscountPercentage / 100
    # @savings = @product.BasePrice * @product.DiscountPercentage / 100
  end
  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params

      params.require(:product).permit(:Title, :slug, :SubTitle, :ImageURL, 
                                      :TargetURL, :Wants, :CreatedByUserId, 
                                      :Currency, :Price, :IsPublished, 
                                      :MerchantId, :SKUId, :Category, :StartDate, :EndDate, 
                                      :DestinationId, :Description, :Highlights, :Condition, 
                                      :BasePrice, :DiscountPercentage, :IsInfinite, :Blurb, :Widget1, :Widget2, :Address, :LocationName, :ValidityStart, :ValidityEnd)
    end
end
