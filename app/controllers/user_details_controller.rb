class UserDetailsController < ApplicationController
  before_action :set_user_detail, only: [:show, :edit, :update, :destroy, :trips, :settings]
  load_and_authorize_resource
  # GET /user_details
  # GET /user_details.json
  def trips
    @username = ""
    oauth_access_token = session['authdata']
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
    list_of_trips = Trip.where("userid = ?", current_user.id)
    # trips_tokenized = list_of_trips.map(&:feedid)
    @trip_array = Array.new
    list_of_trips.each do | el |
      feed_record = Feed.find(el.feedid)      
      trip = { :image => feed_record.ImageUrl, 
             :title => feed_record.Title,
             :startdate => el.StartDate.to_formatted_s(:trip),
             :enddate => el.EndDate.to_formatted_s(:trip),
             :tripid => el.id
           }
      @trip_array.push(trip)
    end
    # @trip_array.each do | el |
      
    # end

    @feeds = list_of_trips
    # we need to display the list directly x times, not the feed
    # @feeds = Feed.readonly.where(id:trips_tokenized).order("id desc")
  end

  def settings
  end

  def index
    @user_details = UserDetail.all
  end

  # GET /user_details/1
  # GET /user_details/1.json
  def show
  end

  # GET /user_details/new
  def new
    @user_detail = UserDetail.new
  end

  # GET /user_details/1/edit
  def edit
  end

  # POST /user_details
  # POST /user_details.json
  def create
    @user_detail = UserDetail.new(user_detail_params)

    respond_to do |format|
      if @user_detail.save
        format.html { redirect_to @user_detail, notice: 'User detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_details/1
  # PATCH/PUT /user_details/1.json
  def update
    respond_to do |format|
      if @user_detail.update(user_detail_params)
        format.html { redirect_to @user_detail, notice: 'User detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_details/1
  # DELETE /user_details/1.json
  def destroy
    @user_detail.destroy
    respond_to do |format|
      format.html { redirect_to user_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_detail
      @user_detail = UserDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_detail_params
      params.require(:user_detail).permit(:FirstName, :LastName, :Age, :Email, :UserId, :StreetAddr, :State, :City, :Zipcode, :Country, :Income, :Gender)
    end
end
