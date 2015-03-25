require 'test_helper'

class ProductPriceListsControllerTest < ActionController::TestCase
  setup do
    @product_price_list = product_price_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_price_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_price_list" do
    assert_difference('ProductPriceList.count') do
      post :create, product_price_list: { DayOfYear: @product_price_list.DayOfYear, Price: @product_price_list.Price }
    end

    assert_redirected_to product_price_list_path(assigns(:product_price_list))
  end

  test "should show product_price_list" do
    get :show, id: @product_price_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_price_list
    assert_response :success
  end

  test "should update product_price_list" do
    patch :update, id: @product_price_list, product_price_list: { DayOfYear: @product_price_list.DayOfYear, Price: @product_price_list.Price }
    assert_redirected_to product_price_list_path(assigns(:product_price_list))
  end

  test "should destroy product_price_list" do
    assert_difference('ProductPriceList.count', -1) do
      delete :destroy, id: @product_price_list
    end

    assert_redirected_to product_price_lists_path
  end
end
