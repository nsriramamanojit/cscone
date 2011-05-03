require 'test_helper'

class Admin::StatesControllerTest < ActionController::TestCase
  setup do
    @admin_state = admin_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_state" do
    assert_difference('Admin::State.count') do
      post :create, :admin_state => @admin_state.attributes
    end

    assert_redirected_to admin_state_path(assigns(:admin_state))
  end

  test "should show admin_state" do
    get :show, :id => @admin_state.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_state.to_param
    assert_response :success
  end

  test "should update admin_state" do
    put :update, :id => @admin_state.to_param, :admin_state => @admin_state.attributes
    assert_redirected_to admin_state_path(assigns(:admin_state))
  end

  test "should destroy admin_state" do
    assert_difference('Admin::State.count', -1) do
      delete :destroy, :id => @admin_state.to_param
    end

    assert_redirected_to admin_states_path
  end
end
