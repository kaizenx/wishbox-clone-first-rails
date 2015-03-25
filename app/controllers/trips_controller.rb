class TripsController < ApplicationController
  before_action :set_user_in_feed, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def update_trip_date
    tripid = params[:id]
    start_date = params[:StartDate]
    end_date = params[:EndDate]
    startdate = DateTime.parse(start_date)
    enddate = DateTime.parse(end_date)
    if startdate < enddate
      userintrip = Trip.where(:id => tripid,
                                    :TripCreator => current_user.id
                                    ).where( "StartDate >= ? and EndDate <= ?", startdate, enddate ).take
      if userintrip != nil
        userintrip.StartDate = startdate
        userintrip.EndDate = enddate
        userintrip.save
      end
    end
  end

  def index
    @trips = Trip.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(user_in_feed_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'User in feed was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trip }
      else
        format.html { render action: 'new' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(user_in_feed_params)
        format.html { redirect_to @trip, notice: 'User in feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_in_feed
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_in_feed_params
      params.require(:user_in_feed).permit(:userid, :feedid)
    end
end
