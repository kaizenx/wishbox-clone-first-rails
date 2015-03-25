require 'test_helper'

class UserWantsControllerTest < ActionController::TestCase
  setup do
    @user_want = user_wants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_wants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_want" do
    assert_difference('UserWant.count') do
      post :create, user_want: { ProductId: @user_want.ProductId, UserId: @user_want.UserId }
    end

    assert_redirected_to user_want_path(assigns(:user_want))
  end

  test "should show user_want" do
    get :show, id: @user_want
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_want
    assert_response :success
  end

  test "should update user_want" do
    patch :update, id: @user_want, user_want: { ProductId: @user_want.ProductId, UserId: @user_want.UserId }
    assert_redirected_to user_want_path(assigns(:user_want))
  end

  test "should destroy user_want" do
    assert_difference('UserWant.count', -1) do
      delete :destroy, id: @user_want
    end

    assert_redirected_to user_wants_path
  end
end
