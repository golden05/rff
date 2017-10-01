require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "get login" do
    get login_url
    assert_response :success
  end

  test "show login message" do
    get login_url
    assert_select 'h1', "Please Login"
  end

  test "success login to redirect admin_index" do
    post login_url, params: { name: 'admin', password: 'password' }
    assert_redirected_to admin_index_url
  end

  test "success after login show message" do
    post login_url, params: { name: 'admin', password: 'password'}
    follow_redirect!
    assert_select 'h1', 'welcome admin'
  end

  test "failer login to redirect login" do
    post login_url, params: { name: 'dd',password: ''}
    assert_response :redirect
  end 

  test "something interesting" do
    
  end
end
