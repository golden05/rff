require 'test_helper'

class SessionsControllerTest < Rff::IntegrationTest 
  test "get login" do
    get login_url
    assert_response :success
  end

  test "show login message" do
    get login_url
    assert_select 'h1', "Please Login"
  end

  test "success login to redirect admin_index" do
    log_user('admin','password')
    assert_redirected_to admin_index_url
  end

  test "success after login show message" do
    log_user('admin','password')
    follow_redirect!
    assert_select 'h1', 'welcome admin'
  end

  test "failer login to redirect login" do
    log_user('dd','')
    assert_response :redirect
  end 

  test "logout system" do
    log_user('admin','password')
    follow_redirect!
    delete logout_url
    assert_nil session[:user_id]
  end
end
