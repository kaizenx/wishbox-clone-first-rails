require 'test_helper'

class UserDetailsControllerTest < ActionController::TestCase
  setup do
    @user_detail = user_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_detail" do
    assert_difference('UserDetail.count') do
      post :create, user_detail: { Age: @user_detail.Age, City: @user_detail.City, Country: @user_detail.Country, Email: @user_detail.Email, FirstName: @user_detail.FirstName, Gender: @user_detail.Gender, Income: @user_detail.Income, LastName: @user_detail.LastName, State: @user_detail.State, StreetAddr: @user_detail.StreetAddr, UserId: @user_detail.UserId, Zipcode: @user_detail.Zipcode }
    end

    assert_redirected_to user_detail_path(assigns(:user_detail))
  end

  test "should show user_detail" do
    get :show, id: @user_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_detail
    assert_response :success
  end

  test "should update user_detail" do
    patch :update, id: @user_detail, user_detail: { Age: @user_detail.Age, City: @user_detail.City, Country: @user_detail.Country, Email: @user_detail.Email, FirstName: @user_detail.FirstName, Gender: @user_detail.Gender, Income: @user_detail.Income, LastName: @user_detail.LastName, State: @user_detail.State, StreetAddr: @user_detail.StreetAddr, UserId: @user_detail.UserId, Zipcode: @user_detail.Zipcode }
    assert_redirected_to user_detail_path(assigns(:user_detail))
  end

  test "should destroy user_detail" do
    assert_difference('UserDetail.count', -1) do
      delete :destroy, id: @user_detail
    end

    assert_redirected_to user_details_path
  end
end
