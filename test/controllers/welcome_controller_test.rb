require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "Should redirect if there is no current_user" do
    get :index
    assert_response :redirect
  end

  test "Should succeed if current_user exists" do
    if not User.first
      User.create
    end

    @user = User.first
    session[:user_id] = @user.id
    get :index
    assert_response :success
    session[:user_id] = nil
  end

  test "About page should load" do
    get :aboutUs
    assert_response :success
  end

  test "Login Page should load if there is no current user" do
    get :login
    assert_response :success
  end

  test "Login Page should redirect if there is a current user" do
    if not User.first
      User.create
    end

    @user = User.first
    session[:user_id] = @user.id
    get :login
    assert_response :redirect
    session[:user_id] = nil
  end

end




