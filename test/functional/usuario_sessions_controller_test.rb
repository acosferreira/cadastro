require 'test_helper'

class UsuarioSessionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuario_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario_session" do
    assert_difference('UsuarioSession.count') do
      post :create, :usuario_session => { }
    end

    assert_redirected_to usuario_session_path(assigns(:usuario_session))
  end

  test "should show usuario_session" do
    get :show, :id => usuario_sessions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => usuario_sessions(:one).to_param
    assert_response :success
  end

  test "should update usuario_session" do
    put :update, :id => usuario_sessions(:one).to_param, :usuario_session => { }
    assert_redirected_to usuario_session_path(assigns(:usuario_session))
  end

  test "should destroy usuario_session" do
    assert_difference('UsuarioSession.count', -1) do
      delete :destroy, :id => usuario_sessions(:one).to_param
    end

    assert_redirected_to usuario_sessions_path
  end
end
