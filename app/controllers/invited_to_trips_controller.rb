class InvitedToTripsController < ApplicationController
  before_action :set_invited_to_trip, only: [:show, :edit, :update, :destroy]

  def invite_member_friend
    friend_user_id = params[:userid]
    tripid = params[:tripid]
    friend_user_id.each do |el|
      new_invitee = InvitedToTrip.where(InviterId:current_user.id, InviteeId:el, TripId:tripid ).take
      if new_invitee == nil
        new_invitee = InvitedToTrip.create(InviterId:current_user.id, InviteeId:el, TripId:tripid )
        new_invitee.save
      end
    end
  end

  def invite
    friend_user_id = params[:userid]
    tripid = params[:tripid]
    friend_user_id.each do |el|
      new_invitee = InvitedToTrip.where(InviterId:current_user.id, NonMemberInviteeId:el, TripId:tripid ).take
      if new_invitee == nil
        new_invitee = InvitedToTrip.create(InviterId:current_user.id, NonMemberInviteeId:el, TripId:tripid )
        new_invitee.save
      end
    end
  end

  # GET /invited_to_trips
  # GET /invited_to_trips.json
  def index
    @invited_to_trips = InvitedToTrip.all
  end

  # GET /invited_to_trips/1
  # GET /invited_to_trips/1.json
  def show
  end

  # GET /invited_to_trips/new
  def new
    @invited_to_trip = InvitedToTrip.new
  end

  # GET /invited_to_trips/1/edit
  def edit
  end

  # POST /invited_to_trips
  # POST /invited_to_trips.json
  def create
    @invited_to_trip = InvitedToTrip.new(invited_to_trip_params)

    respond_to do |format|
      if @invited_to_trip.save
        format.html { redirect_to @invited_to_trip, notice: 'Invited to trip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invited_to_trip }
      else
        format.html { render action: 'new' }
        format.json { render json: @invited_to_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invited_to_trips/1
  # PATCH/PUT /invited_to_trips/1.json
  def update
    respond_to do |format|
      if @invited_to_trip.update(invited_to_trip_params)
        format.html { redirect_to @invited_to_trip, notice: 'Invited to trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invited_to_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invited_to_trips/1
  # DELETE /invited_to_trips/1.json
  def destroy
    @invited_to_trip.destroy
    respond_to do |format|
      format.html { redirect_to invited_to_trips_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invited_to_trip
      @invited_to_trip = InvitedToTrip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invited_to_trip_params
      params.require(:invited_to_trip).permit(:InviterId, :InviteeId, :NonMemberInviteeId, :TripId)
    end
end
