require 'test_helper'

class Admin::CscBlocksControllerTest < ActionController::TestCase
  setup do
    @admin_csc_block = admin_csc_blocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_csc_blocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_csc_block" do
    assert_difference('Admin::CscBlock.count') do
      post :create, :admin_csc_block => @admin_csc_block.attributes
    end

    assert_redirected_to admin_csc_block_path(assigns(:admin_csc_block))
  end

  test "should show admin_csc_block" do
    get :show, :id => @admin_csc_block.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_csc_block.to_param
    assert_response :success
  end

  test "should update admin_csc_block" do
    put :update, :id => @admin_csc_block.to_param, :admin_csc_block => @admin_csc_block.attributes
    assert_redirected_to admin_csc_block_path(assigns(:admin_csc_block))
  end

  test "should destroy admin_csc_block" do
    assert_difference('Admin::CscBlock.count', -1) do
      delete :destroy, :id => @admin_csc_block.to_param
    end

    assert_redirected_to admin_csc_blocks_path
  end
end
