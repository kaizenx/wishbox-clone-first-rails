require 'test_helper'

class ProductInFeedsControllerTest < ActionController::TestCase
  setup do
    @product_in_feed = product_in_feeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_in_feeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_in_feed" do
    assert_difference('ProductInFeed.count') do
      post :create, product_in_feed: { feedid: @product_in_feed.feedid, productid: @product_in_feed.productid }
    end

    assert_redirected_to product_in_feed_path(assigns(:product_in_feed))
  end

  test "should show product_in_feed" do
    get :show, id: @product_in_feed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_in_feed
    assert_response :success
  end

  test "should update product_in_feed" do
    patch :update, id: @product_in_feed, product_in_feed: { feedid: @product_in_feed.feedid, productid: @product_in_feed.productid }
    assert_redirected_to product_in_feed_path(assigns(:product_in_feed))
  end

  test "should destroy product_in_feed" do
    assert_difference('ProductInFeed.count', -1) do
      delete :destroy, id: @product_in_feed
    end

    assert_redirected_to product_in_feeds_path
  end
end
