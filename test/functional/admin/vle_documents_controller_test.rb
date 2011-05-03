require 'test_helper'

class Admin::VleDocumentsControllerTest < ActionController::TestCase
  setup do
    @admin_vle_document = admin_vle_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_vle_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_vle_document" do
    assert_difference('Admin::VleDocument.count') do
      post :create, :admin_vle_document => @admin_vle_document.attributes
    end

    assert_redirected_to admin_vle_document_path(assigns(:admin_vle_document))
  end

  test "should show admin_vle_document" do
    get :show, :id => @admin_vle_document.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_vle_document.to_param
    assert_response :success
  end

  test "should update admin_vle_document" do
    put :update, :id => @admin_vle_document.to_param, :admin_vle_document => @admin_vle_document.attributes
    assert_redirected_to admin_vle_document_path(assigns(:admin_vle_document))
  end

  test "should destroy admin_vle_document" do
    assert_difference('Admin::VleDocument.count', -1) do
      delete :destroy, :id => @admin_vle_document.to_param
    end

    assert_redirected_to admin_vle_documents_path
  end
end
