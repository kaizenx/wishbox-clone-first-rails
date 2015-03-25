require 'test_helper'

class PreviewSignUpsControllerTest < ActionController::TestCase
  setup do
    @preview_sign_up = preview_sign_ups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:preview_sign_ups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preview_sign_up" do
    assert_difference('PreviewSignUp.count') do
      post :create, preview_sign_up: { EmailAddress: @preview_sign_up.EmailAddress }
    end

    assert_redirected_to preview_sign_up_path(assigns(:preview_sign_up))
  end

  test "should show preview_sign_up" do
    get :show, id: @preview_sign_up
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @preview_sign_up
    assert_response :success
  end

  test "should update preview_sign_up" do
    patch :update, id: @preview_sign_up, preview_sign_up: { EmailAddress: @preview_sign_up.EmailAddress }
    assert_redirected_to preview_sign_up_path(assigns(:preview_sign_up))
  end

  test "should destroy preview_sign_up" do
    assert_difference('PreviewSignUp.count', -1) do
      delete :destroy, id: @preview_sign_up
    end

    assert_redirected_to preview_sign_ups_path
  end
end
