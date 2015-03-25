class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]
  def listing
    # strategy = Devise.omniauth_configs[:facebook].strategy
    
    # @app_id = strategy.client_id

    #get friend list
    oauth_access_token = session['authdata']
    @username = ""
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
    # feed
    user_in_feed_id = params[:id]
    user_in_feed = Trip.find_by_id(user_in_feed_id)
    # changed to using feedid until we separate destinations from feeds again
    # destination = Destination.find_by_id(user_in_feed.DestinationId)
    # destination = Destination.find_by_id(user_in_feed.feedid)
    feed = Feed.find_by_id(user_in_feed.feedid)

    feedid = user_in_feed.feedid
    @destination_name = feed.Title
    # @destination_name = destination.Name
    startdate = user_in_feed.StartDate
    enddate = user_in_feed.EndDate

    



    startdate = DateTime.parse(startdate.to_s)
    enddate = DateTime.parse(enddate.to_s)

    @startdate = startdate.strftime("%d-%m-%Y")
    @enddate = enddate.strftime("%d-%m-%Y")

    feed_active_record = Feed.friendly.find(feedid)
    feedid = feed_active_record.id
    @feedtitle = feed_active_record.Title
    
    # destination


    # deals
    # product_id_list = ProductInFeed.select("productid").where(FeedId:feedid)  
    # product_tokenized = product_id_list.map(&:productid)
    # @default_products = Product.readonly.where(id:product_tokenized).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    product_id_list = Itinerary.select("ProductId").where(TripId:user_in_feed_id)  
    product_tokenized = product_id_list.map(&:ProductId)
    # deals
    # @flight_products = Product.readonly.where(id:product_tokenized, category:1).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    # @hotel_products = Product.readonly.where(id:product_tokenized, category:2).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    @deal_products = Product.readonly.where(id:product_tokenized, category:3).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    @deal_products_available = Product.readonly.where(category:3).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    

    @shop_products = Product.readonly.where(id:product_tokenized, category:4).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    @shop_products_available= Product.readonly.where(category:4).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    
    @souvenier_products = Product.readonly.where(id:product_tokenized, category:5).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    @souvenier_products_available = Product.readonly.where(category:5).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    

    #also create user in trip and add this user to the trip
    @tripid = user_in_feed_id
    cookies[:current_tripid] = user_in_feed_id
  end
  # GET /itineraries
  # GET /itineraries.json
  def index
    @itineraries = Itinerary.all
  end

  # GET /itineraries/1
  # GET /itineraries/1.json
  def show
  end

  # GET /itineraries/new
  def new
    @itinerary = Itinerary.new
  end

  # GET /itineraries/1/edit
  def edit
  end

  # POST /itineraries
  # POST /itineraries.json
  def create
    @itinerary = Itinerary.new(itinerary_params)

    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @itinerary }
      else
        format.html { render action: 'new' }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itineraries/1
  # PATCH/PUT /itineraries/1.json
  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1
  # DELETE /itineraries/1.json
  def destroy
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to itineraries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_params
      params.require(:itinerary).permit(:UserId, :ProductId, :TripId, :FeedId)
    end
end
