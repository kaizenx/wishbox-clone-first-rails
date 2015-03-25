require 'test_helper'

class PageFeedsControllerTest < ActionController::TestCase
  setup do
    @page_feed = page_feeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_feeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_feed" do
    assert_difference('PageFeed.count') do
      post :create, page_feed: { FeedList: @page_feed.FeedList, UserId: @page_feed.UserId }
    end

    assert_redirected_to page_feed_path(assigns(:page_feed))
  end

  test "should show page_feed" do
    get :show, id: @page_feed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_feed
    assert_response :success
  end

  test "should update page_feed" do
    patch :update, id: @page_feed, page_feed: { FeedList: @page_feed.FeedList, UserId: @page_feed.UserId }
    assert_redirected_to page_feed_path(assigns(:page_feed))
  end

  test "should destroy page_feed" do
    assert_difference('PageFeed.count', -1) do
      delete :destroy, id: @page_feed
    end

    assert_redirected_to page_feeds_path
  end
end
