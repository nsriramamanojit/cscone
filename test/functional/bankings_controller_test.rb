require 'test_helper'

class BankingsControllerTest < ActionController::TestCase
  setup do
    @banking = bankings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bankings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create banking" do
    assert_difference('Banking.count') do
      post :create, :banking => @banking.attributes
    end

    assert_redirected_to banking_path(assigns(:banking))
  end

  test "should show banking" do
    get :show, :id => @banking.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @banking.to_param
    assert_response :success
  end

  test "should update banking" do
    put :update, :id => @banking.to_param, :banking => @banking.attributes
    assert_redirected_to banking_path(assigns(:banking))
  end

  test "should destroy banking" do
    assert_difference('Banking.count', -1) do
      delete :destroy, :id => @banking.to_param
    end

    assert_redirected_to bankings_path
  end
end
