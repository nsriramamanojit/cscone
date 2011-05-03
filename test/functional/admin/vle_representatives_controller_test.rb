require 'test_helper'

class Admin::VleRepresentativesControllerTest < ActionController::TestCase
  setup do
    @admin_vle_representative = admin_vle_representatives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_vle_representatives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_vle_representative" do
    assert_difference('Admin::VleRepresentative.count') do
      post :create, :admin_vle_representative => @admin_vle_representative.attributes
    end

    assert_redirected_to admin_vle_representative_path(assigns(:admin_vle_representative))
  end

  test "should show admin_vle_representative" do
    get :show, :id => @admin_vle_representative.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_vle_representative.to_param
    assert_response :success
  end

  test "should update admin_vle_representative" do
    put :update, :id => @admin_vle_representative.to_param, :admin_vle_representative => @admin_vle_representative.attributes
    assert_redirected_to admin_vle_representative_path(assigns(:admin_vle_representative))
  end

  test "should destroy admin_vle_representative" do
    assert_difference('Admin::VleRepresentative.count', -1) do
      delete :destroy, :id => @admin_vle_representative.to_param
    end

    assert_redirected_to admin_vle_representatives_path
  end
end
