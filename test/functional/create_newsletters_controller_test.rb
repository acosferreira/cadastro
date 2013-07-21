require 'test_helper'

class CreateNewslettersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:create_newsletters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create create_newsletter" do
    assert_difference('CreateNewsletter.count') do
      post :create, :create_newsletter => { }
    end

    assert_redirected_to create_newsletter_path(assigns(:create_newsletter))
  end

  test "should show create_newsletter" do
    get :show, :id => create_newsletters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => create_newsletters(:one).to_param
    assert_response :success
  end

  test "should update create_newsletter" do
    put :update, :id => create_newsletters(:one).to_param, :create_newsletter => { }
    assert_redirected_to create_newsletter_path(assigns(:create_newsletter))
  end

  test "should destroy create_newsletter" do
    assert_difference('CreateNewsletter.count', -1) do
      delete :destroy, :id => create_newsletters(:one).to_param
    end

    assert_redirected_to create_newsletters_path
  end
end
