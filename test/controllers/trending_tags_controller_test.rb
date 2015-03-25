require 'test_helper'

class TrendingTagsControllerTest < ActionController::TestCase
  setup do
    @trending_tag = trending_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trending_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trending_tag" do
    assert_difference('TrendingTag.count') do
      post :create, trending_tag: { Tags: @trending_tag.Tags }
    end

    assert_redirected_to trending_tag_path(assigns(:trending_tag))
  end

  test "should show trending_tag" do
    get :show, id: @trending_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trending_tag
    assert_response :success
  end

  test "should update trending_tag" do
    patch :update, id: @trending_tag, trending_tag: { Tags: @trending_tag.Tags }
    assert_redirected_to trending_tag_path(assigns(:trending_tag))
  end

  test "should destroy trending_tag" do
    assert_difference('TrendingTag.count', -1) do
      delete :destroy, id: @trending_tag
    end

    assert_redirected_to trending_tags_path
  end
end
