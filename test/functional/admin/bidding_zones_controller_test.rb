require 'test_helper'

class Admin::BiddingZonesControllerTest < ActionController::TestCase
  setup do
    @admin_bidding_zone = admin_bidding_zones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_bidding_zones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_bidding_zone" do
    assert_difference('Admin::BiddingZone.count') do
      post :create, :admin_bidding_zone => @admin_bidding_zone.attributes
    end

    assert_redirected_to admin_bidding_zone_path(assigns(:admin_bidding_zone))
  end

  test "should show admin_bidding_zone" do
    get :show, :id => @admin_bidding_zone.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_bidding_zone.to_param
    assert_response :success
  end

  test "should update admin_bidding_zone" do
    put :update, :id => @admin_bidding_zone.to_param, :admin_bidding_zone => @admin_bidding_zone.attributes
    assert_redirected_to admin_bidding_zone_path(assigns(:admin_bidding_zone))
  end

  test "should destroy admin_bidding_zone" do
    assert_difference('Admin::BiddingZone.count', -1) do
      delete :destroy, :id => @admin_bidding_zone.to_param
    end

    assert_redirected_to admin_bidding_zones_path
  end
end
