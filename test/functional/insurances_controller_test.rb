require 'test_helper'

class InsurancesControllerTest < ActionController::TestCase
  setup do
    @insurance = insurances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insurances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insurance" do
    assert_difference('Insurance.count') do
      post :create, :insurance => @insurance.attributes
    end

    assert_redirected_to insurance_path(assigns(:insurance))
  end

  test "should show insurance" do
    get :show, :id => @insurance.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @insurance.to_param
    assert_response :success
  end

  test "should update insurance" do
    put :update, :id => @insurance.to_param, :insurance => @insurance.attributes
    assert_redirected_to insurance_path(assigns(:insurance))
  end

  test "should destroy insurance" do
    assert_difference('Insurance.count', -1) do
      delete :destroy, :id => @insurance.to_param
    end

    assert_redirected_to insurances_path
  end
end
