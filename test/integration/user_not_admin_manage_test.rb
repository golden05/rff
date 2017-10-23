require 'test_helper'

class UserNotAdminManageTest < Rff::IntegrationTest

  test "admin not login can now show all user page" do
    get users_url
    assert_response :redirect 
  end
end
