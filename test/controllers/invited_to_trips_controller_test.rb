require 'test_helper'

class InvitedToTripsControllerTest < ActionController::TestCase
  setup do
    @invited_to_trip = invited_to_trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invited_to_trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invited_to_trip" do
    assert_difference('InvitedToTrip.count') do
      post :create, invited_to_trip: { InviteeId: @invited_to_trip.InviteeId, InviterId: @invited_to_trip.InviterId, NonMemberInviteeId: @invited_to_trip.NonMemberInviteeId, TripId: @invited_to_trip.TripId }
    end

    assert_redirected_to invited_to_trip_path(assigns(:invited_to_trip))
  end

  test "should show invited_to_trip" do
    get :show, id: @invited_to_trip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invited_to_trip
    assert_response :success
  end

  test "should update invited_to_trip" do
    patch :update, id: @invited_to_trip, invited_to_trip: { InviteeId: @invited_to_trip.InviteeId, InviterId: @invited_to_trip.InviterId, NonMemberInviteeId: @invited_to_trip.NonMemberInviteeId, TripId: @invited_to_trip.TripId }
    assert_redirected_to invited_to_trip_path(assigns(:invited_to_trip))
  end

  test "should destroy invited_to_trip" do
    assert_difference('InvitedToTrip.count', -1) do
      delete :destroy, id: @invited_to_trip
    end

    assert_redirected_to invited_to_trips_path
  end
end
