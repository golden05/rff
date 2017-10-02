require 'test_helper'

class AdminControllerTest < Rff::IntegrationTest 
  test "not login redirect to login" do
    get admin_index_url
    assert_redirected_to login_url
  end

  test "not admin login redirect to login" do
    log_user(users(:opera).name, 'password') 
    get admin_index_url
    assert_redirected_to login_url
  end

  test "admin login to admin index" do
    log_user(users(:admin).name, 'password') 
    get admin_index_url
    assert_response :success
  end
end
