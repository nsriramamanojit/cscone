require 'test_helper'

class Admin::DistrictsControllerTest < ActionController::TestCase
  setup do
    @admin_district = admin_districts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_districts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_district" do
    assert_difference('Admin::District.count') do
      post :create, :admin_district => @admin_district.attributes
    end

    assert_redirected_to admin_district_path(assigns(:admin_district))
  end

  test "should show admin_district" do
    get :show, :id => @admin_district.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_district.to_param
    assert_response :success
  end

  test "should update admin_district" do
    put :update, :id => @admin_district.to_param, :admin_district => @admin_district.attributes
    assert_redirected_to admin_district_path(assigns(:admin_district))
  end

  test "should destroy admin_district" do
    assert_difference('Admin::District.count', -1) do
      delete :destroy, :id => @admin_district.to_param
    end

    assert_redirected_to admin_districts_path
  end
end
