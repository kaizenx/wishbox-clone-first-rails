require 'test_helper'

class UserInFeedsControllerTest < ActionController::TestCase
  setup do
    @user_in_feed = user_in_feeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_in_feeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_in_feed" do
    assert_difference('Trip.count') do
      post :create, user_in_feed: { feedid: @user_in_feed.feedid, userid: @user_in_feed.userid }
    end

    assert_redirected_to user_in_feed_path(assigns(:user_in_feed))
  end

  test "should show user_in_feed" do
    get :show, id: @user_in_feed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_in_feed
    assert_response :success
  end

  test "should update user_in_feed" do
    patch :update, id: @user_in_feed, user_in_feed: { feedid: @user_in_feed.feedid, userid: @user_in_feed.userid }
    assert_redirected_to user_in_feed_path(assigns(:user_in_feed))
  end

  test "should destroy user_in_feed" do
    assert_difference('Trip.count', -1) do
      delete :destroy, id: @user_in_feed
    end

    assert_redirected_to user_in_feeds_path
  end
end
