class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy, :listing, :location]
  # fixes cancan issue with strong params
  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  load_and_authorize_resource

  def location
    feedid = params[:id]
    if feedid == nil
      feedid = Feed.where(Isadmin:true, IsPublished:true).take
    end
    feed_active_record = Feed.friendly.find(feedid)
    @title = feed_active_record.Title
    @subtitle = feed_active_record.Subtitle
    @imglink = feed_active_record.ImageUrl
    # @destinations = Destination.where(FeedId:feedid)
    @friendlyid = feed_active_record.friendly_id
    @description = feed_active_record.Description
    @blurb = feed_active_record.Blurb

    @products = Product.find(:all, :limit=>4)
  end
  
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
    feedid = params[:id]
    
    destinationid = params[:destinations]
    destination = Destination.find_by_id(destinationid)
    # @destination_name = destination.Name
    startdate = params[:startdate]
    enddate = params[:enddate]
    @start_date = startdate
    @end_date = enddate
    startdate = DateTime.parse(startdate)
    enddate = DateTime.parse(enddate)

    @startdate = startdate.strftime("%d-%m-%Y")
    @enddate = enddate.strftime("%d-%m-%Y")

    feed_active_record = Feed.friendly.find(feedid)
    feedid = feed_active_record.id
    @feedtitle = feed_active_record.Title
    
    # destination


    # deals
    product_id_list = ProductInFeed.select("productid").where(FeedId:feedid)  
    product_tokenized = product_id_list.map(&:productid)
    @flight_products = Product.readonly.where(id:product_tokenized, category:1).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    @hotel_products = Product.readonly.where(id:product_tokenized, category:2).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    @deal_products = Product.readonly.where(id:product_tokenized, category:3).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    @shop_products = Product.readonly.where(id:product_tokenized, category:4).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    @souvenier_products = Product.readonly.where(id:product_tokenized, category:5).where( "( StartDate >= ? and EndDate <= ? ) or IsInfinite = ? ", startdate, enddate, true ).order("id desc")
    

    #also create user in trip and add this user to the trip
    userintrip = Trip.where(:userid => current_user.id, 
                                  :feedid => feedid, 
                                  :TripCreator => current_user.id,
                                  ).where( "StartDate >= ? and EndDate <= ?", startdate, enddate ).take
    @tripid = -1;
    if userintrip == nil
      userintrip = Trip.new(:userid => current_user.id, 
                                  :feedid => feedid, 
                                  :TripCreator => current_user.id,
                                  :StartDate => startdate,
                                  :EndDate => enddate
                                  )
      userintrip.save
      @tripid = userintrip.id

    else
      @tripid = userintrip.id
    end

    @not_creator = userintrip.TripCreator != current_user.id;

    cookies[:current_tripid] = @tripid
  end

  def create_feed
    feed = Feed.new(:UserId => current_user.id, :IsAdmin => true, :IsSponsor => false, :restricted => true, :ImageUrl => "", 
                    :Title => "DEFAULT TITLE", :Subtitle => "", :IsPublished => false, :slug => "default-title", :Description => "", :Blurb => "")
    feed.save
    redirect_to '/feeds'
  end

  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
    
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render action: 'show', status: :created, location: @feed }
      else
        format.html { render action: 'new' }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    puts "NIAMA" 
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:UserId, :IsAdmin, :IsSponsor, :restricted, :ImageUrl, :Title, :Subtitle, :IsPublished, :slug, :Description, :Blurb,:lat, :lng)
      # params.require(:feed).permit(:UserId, :IsAdmin, :Title, :Subtitle, :ImageUrl, :IsSponsor, :restricted, :IsPublished, :Description, :slug, :lat, :lng)
    end
end
