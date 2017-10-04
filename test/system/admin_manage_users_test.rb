require "application_system_test_case"

class AdminManageUsersTest < ApplicationSystemTestCase
 
  def setup
    loginBy('admin', 'password')
    click_link "manage users"
  end

  test "visit the manager users index" do
    assert page.has_content?("Users Index")
    assert page.has_content?("admin")
  end

  test "add a user" do
    click_link "new user"
    fill_in "Name", with: "jam"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "create a user"
    assert page.has_content?("jam")
  end
end
