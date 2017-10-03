require "application_system_test_case"

class AdminManageUsersTest < ApplicationSystemTestCase
  
  test "visit the manager users index" do
    loginBy('admin', 'password')
    click_link "manage users"
    assert page.has_content?("Users Index")
    assert page.has_content?("admin")
  end
end
