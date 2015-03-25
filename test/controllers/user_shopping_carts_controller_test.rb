require 'test_helper'

class UserShoppingCartsControllerTest < ActionController::TestCase
  setup do
    @user_shopping_cart = user_shopping_carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_shopping_carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_shopping_cart" do
    assert_difference('UserShoppingCart.count') do
      post :create, user_shopping_cart: { isshow: @user_shopping_cart.isshow, productid: @user_shopping_cart.productid, userid: @user_shopping_cart.userid }
    end

    assert_redirected_to user_shopping_cart_path(assigns(:user_shopping_cart))
  end

  test "should show user_shopping_cart" do
    get :show, id: @user_shopping_cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_shopping_cart
    assert_response :success
  end

  test "should update user_shopping_cart" do
    patch :update, id: @user_shopping_cart, user_shopping_cart: { isshow: @user_shopping_cart.isshow, productid: @user_shopping_cart.productid, userid: @user_shopping_cart.userid }
    assert_redirected_to user_shopping_cart_path(assigns(:user_shopping_cart))
  end

  test "should destroy user_shopping_cart" do
    assert_difference('UserShoppingCart.count', -1) do
      delete :destroy, id: @user_shopping_cart
    end

    assert_redirected_to user_shopping_carts_path
  end
end
